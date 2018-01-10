class Cart < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :food, optional: true
  validates :quantity, presence: true, numericality: { greater_than: 0,  only_integer: true }

  scope :cart_amount_session, -> session_id {
    where(session_id: session_id)
  }

  def Cart.total
    carts = Cart.all
    carts.each do |c|
      total = total +  c.quantity * c.price
    end
    return total
  end
end

