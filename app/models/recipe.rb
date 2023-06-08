class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :alcohol_genre
end
