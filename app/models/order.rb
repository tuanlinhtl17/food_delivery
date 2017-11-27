class Order < ApplicationRecord
  validates :address, presence: true
  validates :total_money, presence: true
  has_many :order_details
  belongs_to :employee
  belongs_to :user
end
