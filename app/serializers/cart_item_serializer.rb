class CartItemSerializer < ActiveModel::Serializer
    attributes %i[:product, :quantity]

    def product
        { 
            name: object.product.name,
            price: object.produt.price
        }
    end
end