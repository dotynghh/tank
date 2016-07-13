class ProductsController < ApplicationController
  
  def index
    @products = Product
    	.page(params[:page] || 1)
    	.per_page(params[:per_page] || 10)
    	.order("id desc")
    	.includes(:user)
  end
  
end
