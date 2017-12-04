class User < ApplicationRecord
  has_many :comment_foods
  has_many :orders
  validates :name ,presence: true, length: {maximum: 30}
  validates :user_name, presence: true, length: {minimum: 6}
  validates :password, presence: true, length: {minimum: 8}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}
  has_secure_password
end
