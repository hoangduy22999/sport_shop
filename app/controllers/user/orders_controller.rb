class User::OrdersController < ApplicationController
    def new
        @cart_items = current_user.shopping_session.cart_items
    end
end
