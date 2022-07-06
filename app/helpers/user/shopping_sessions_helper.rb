module User::ShoppingSessionsHelper
    def items_in_cart
        CartItem.where(shopping_session_id: current_user.shopping_session.id).sum(:quantity)
    end
end
