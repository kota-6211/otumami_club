class Step < ApplicationRecord
  belongs_to :recipe
  
  validates :step_number, presence: true
  validates :discription, presence: true, length: { maximum: 30 }
end
