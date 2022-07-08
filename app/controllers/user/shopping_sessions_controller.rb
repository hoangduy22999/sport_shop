class User::ShoppingSessionsController < ApplicationController
    include User::ShoppingSessionsHelper
    before_action :authenticate_user!

    def show
        render json: {
            data: ActiveModelSerializers::SerializableResource.new(shopping_session, serializer: ShoppingSessionSerializer),
            status: 200,
            type: 'Success'
        }
    end

    def apply_discount
        discount = Discount.find_by(code: params[:code], active: true)
        if discount
            render json: { percent: discount.percent, status: 'success'}
        else
            render json: { error: "Discount is not available", status: 'error' }
        end
    end
end
