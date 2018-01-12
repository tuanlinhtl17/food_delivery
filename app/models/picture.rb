class Picture < ApplicationRecord
  mount_uploader :image, PictureUploader
  belongs_to :comment

  scope :all_food_comment_picture,  -> id{
    joins(:comment).where("comments.food_id = ?", id)
  }
end
