class ShoppingSessionSerializer < ActiveModel::Serializer
    attributes %i[total cart_items]
    
    def cart_items
        object.cart_items.map do |cart_item|
            product = cart_item.product
            { 
                product_name: product.name,
                product_price: product.price,
                quantity: cart_item.quantity
             }
        end
    end
end