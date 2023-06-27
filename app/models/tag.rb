class Tag < ApplicationRecord
  has_many :recipe_tags
  has_many :recipes, through: :recipe_tags

  validates :name, length: { maximum: 10 }

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
