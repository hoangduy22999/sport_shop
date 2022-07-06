class User::HomePageController < ApplicationController
  def index
    @products = Product.all
  end
end
