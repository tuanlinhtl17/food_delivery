class Cart < ApplicationRecord
  belongs_to :food

  scope :cart_amount_user, -> user_id {
    where(user_id: user_id)
  }

  scope :cart_amount_session, -> session_id {
    where(session_id: session_id)
  }
end
