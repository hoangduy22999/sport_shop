class User::ShoppingSessionsController < ApplicationController
    include User::ShoppingSessionsHelper

    def update
        @cart_item = current_user.shopping_session.cart_items.new(cart_items_params)
        if @cart_item.save
            render json: {items_in_cart: items_in_cart }
        else
            render json: { errors: "Can't add item" }
        end
    end

    private
        def cart_items_params
            params.require(:cart_items).permit(:product_id, :quantity)
        end
end
