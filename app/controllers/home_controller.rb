class HomeController < ApplicationController
  def index
    @products = Product.all.where(status: "public")
  end

  def create_order
    @products = Product.find(params[:id])
    if request.post?
      customer_name = params['customer_name']
      address = params['address']
      @order = @products.orders.create(product_id: @product, customer_name: customer_name, address: address)
    end
  end
end
