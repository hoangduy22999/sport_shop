class User::CartItemsController < ApplicationController
    include User::ShoppingSessionsHelper
    before_action :set_cart_item, only: [:show, :destroy]

    def create
        if cart_item = shopping_session.cart_items.find_by(product_id: cart_item_params[:product_id])
            cart_item.update(quantity: cart_item.quantity + cart_item_params[:quantity].to_i)
        else
            cart_item = shopping_session.cart_items.new(cart_item_params)
            render json: { errors: "Can't add item" } unless cart_item.save
        end
        render json: { items_in_cart: items_in_cart }
    end

    def show
        render json: {
            data: ActiveModelSerializers::SerializableResource.new( @cart_item, serializer: CartItemSerializer),
            status: 200,
            type: 'Success'
        }    
    end

    def destroy
        if @cart_item.destroy
            render json: { notice: 'Item was removed' }
        else
            render json: { errors: 'Remove Item failed' }
        end
    end

    private
        def set_cart_item
            @cart_item = CartItem.find(params[:id])
        end

        def cart_item_params
            params.require(:cart_item).permit(:product_id, :quantity)
        end
end
