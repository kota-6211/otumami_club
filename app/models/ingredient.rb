class Ingredient < ApplicationRecord
  has_many :recipes, through: :recipe_ingredients
  has_many :recipe_indredients
  
  validates :name, presence: true, length: { maximum: 20 }
  validates :quantiry, presence: true, length: { maximum: 30 }
end
