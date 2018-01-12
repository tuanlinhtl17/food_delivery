class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_many :pictures
  accepts_nested_attributes_for :pictures, allow_destroy: true

  scope :food_comment, -> id {
    where(food_id: id).order(created_at: :desc)
  }
end
