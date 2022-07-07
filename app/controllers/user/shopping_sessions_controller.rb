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
end
