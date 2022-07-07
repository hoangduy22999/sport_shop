module User::ShoppingSessionsHelper
    def items_in_cart
        current_user.shopping_session.cart_items.sum(:quantity)
    end

    def shopping_session
        current_user.shopping_session
    end
end
