class CartItem < ApplicationRecord
  after_save :update_total_session
  
  belongs_to :shopping_session
  belongs_to :product

  def update_total_session
    total = self.shopping_session.cart_items.sum { |cart_item| cart_item.quantity * cart_item.product.price }
    self.shopping_session.update(total: total)
  end
end
