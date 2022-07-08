class User::OrdersController < ApplicationController
    def new
        @shopping_session = current_user.shopping_session
        @cart_items = current_user.shopping_session.cart_items
    end
end
