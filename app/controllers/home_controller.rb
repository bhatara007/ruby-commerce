class HomeController < ApplicationController
  def index
    @products = Product.all.where(status: "public")
  end
end
