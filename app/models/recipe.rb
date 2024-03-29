class Recipe < ApplicationRecord
  has_one_attached :recipe_image

  belongs_to :user
  belongs_to :alcohol_genre
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :recipe_tags, dependent: :destroy
  has_many :saved_recipes, dependent: :destroy
  has_many :tags, through: :recipe_tags
  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :vision_tags, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 150 }
  validates :recipe_image, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def saved_by?(user)
    saved_recipes.exists?(user_id: user.id)
  end

  def get_recipe_image(width,height)
    unless recipe_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_otumami.jpg')
      recipe_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    recipe_image.variant(resize_to_limit: [width, height]).processed
  end


  def save_tags(tags)

    # タグをスペース区切りで分割し配列にする
    #   連続した空白も対応するので、最後の“+”がポイント
    tag_list = tags.split(/[[:blank:]]+/)
    tag_list.uniq!

    # 自分自身に関連づいたタグを取得する
    current_tags = self.tags.pluck(:name)

    # (1) 元々自分に紐付いていたタグと投稿されたタグの差分を抽出
    #   -- 記事更新時に削除されたタグ
    old_tags = current_tags - tag_list

    # (2) 投稿されたタグと元々自分に紐付いていたタグの差分を抽出
    #   -- 新規に追加されたタグ
    new_tags = tag_list - current_tags

    # tag_mapsテーブルから、(1)のタグを削除
    #   tagsテーブルから該当のタグを探し出して削除する
    old_tags.each do |old|
      # tag_mapsテーブルにあるpost_idとtag_idを削除
      #   後続のfind_byでtag_idを検索
      self.tags.delete Tag.find_by(name: old)
    end

    # tagsテーブルから(2)のタグを探して、tag_mapsテーブルにtag_idを追加する
    new_tags.each do |new|
      # 条件のレコードを初めの1件を取得し1件もなければ作成する
      # find_or_create_by : https://railsdoc.com/page/find_or_create_by
      new_recipe_tag = Tag.find_or_create_by(name: new)

      # tag_mapsテーブルにpost_idとtag_idを保存
      #   配列追加のようにレコードを渡すことで新規レコード作成が可能
      self.tags << new_recipe_tag
    end

  end

  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["tags"]
  end
end
