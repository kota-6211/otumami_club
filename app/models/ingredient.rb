class Ingredient < ApplicationRecord
  has_many :recipes, through: :recipe_ingredients
  has_many :recipe_indredients
  
  validates :name, presence: true
  validates :quantiry, presence: true
end
