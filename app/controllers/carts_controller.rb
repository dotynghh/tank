class CartsController < ApplicationController
 
  def index
    @carts = current_user.carts
      .page(params[:page] || 1)
      .per_page(params[:per_page] || 10)
      .order("id desc")
  end


  def show
  end


  def new
    @cart = Cart.new
  end


  def create
    @cart = current_user.carts.new(product_id: params[:product_id])
    if @cart.save
      flash[:notice] = "加入购物车成功"
      redirect_to products_path
    else
      flash[:notice] = "添加购物车失败"
      redirect_to :back
    end

  end


  def update
    
  end


  def destroy
    @cart = Cart.find params[:id]
    if @cart.destroy
      flash[:notice] = "从购物车移除成功"
      redirect_to carts_path
    else
      flash[:notice] = "从购物车移除成功失败"
      redirect_to :back
    end
  end

  private
    
end
