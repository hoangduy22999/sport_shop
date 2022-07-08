module User::CartItemsHelper
    def price_for_cart_items cart_item
        sprintf('%.2f',cart_item.quantity * cart_item.product.price)
    end
end
