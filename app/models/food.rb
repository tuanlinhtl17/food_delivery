class Food < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  has_many :comment_foods
  has_many :order_details
  has_many :carts
  belongs_to :food_category
  belongs_to :user

  scope :search, -> content {
    where "name LIKE ?", "%#{content}%"
  }

  scope :newfood, -> {
    order("created_at DESC").limit(4)
  }

  scope :hotfood, -> {
    order("rating_avg DESC").limit(4)
  }

  scope :by_chef, -> user_id {
    where(user_id: user_id.to_s).order("rating_avg DESC")
  }
end
