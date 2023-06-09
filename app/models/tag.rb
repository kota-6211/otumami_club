class Tag < ApplicationRecord
  has_many :recieps, through: :recipe_tags
  has_many :recipe_tags
end
