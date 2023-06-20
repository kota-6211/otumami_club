class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :saved_recipes, dependent: :destroy
  has_many :chats, dependent: :destroy

  has_one_attached :profile_image

  validates :user_name, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :phone_number, presence: true


    def get_profile_image(width,height)
      unless profile_image.attached?
        file_path = Rails.root.join('app/assets/images/no_images.jpg')
        profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      profile_image.variant(resize_to_limit: [width, height]).processed
    end
end


