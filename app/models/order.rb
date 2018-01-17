class Order < ApplicationRecord
  validates :address, presence: true
  validates :total_money, presence: true
  validates :customer_id, presence: true
  has_many :order_details, dependent: :destroy
  accepts_nested_attributes_for :order_details, allow_destroy: true
  belongs_to :employee, class_name: "User", optional: true
  belongs_to :customer, class_name: "User", optional: true
  scope :new_order, ->{
    where "status LIKE ?", 1
  }

  scope :inprogress, ->{
    where "status LIKE ?", 2
  }

  scope :done, ->{
    where "status LIKE ?", 3
  }

  def new?
    self.status == Settings.status.new_order
  end

  def in_progress?
    self.status == Settings.status.in_progress
  end

  def done?
    self.status == Settings.status.done
  end

  scope :ordered_by, -> customer_id {
    where("customer_id = ? AND status != ?", customer_id, Settings.status.done).order("created_at DESC")
  }
end
