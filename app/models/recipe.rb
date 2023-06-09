class Recipe < ApplicationRecord
  has_one_attached :recipe_image
  
  belongs_to :user
  belongs_to :alcohol_genre
  has_many :steps
  has_many :tags, through: :recipe_tags
  has_many :recipe_tags
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients
end
