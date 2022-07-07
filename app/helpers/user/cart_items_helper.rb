module User::CartItemsHelper
    def price_for_cart_items cart_item
        (cart_item.quantity * cart_item.product.price).to_i
    end
end
