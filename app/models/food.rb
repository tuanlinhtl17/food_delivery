class Food < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  has_many :comment_foods
  has_many :order_details
  belongs_to :food_category
end
