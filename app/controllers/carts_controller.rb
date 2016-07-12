class CartsController < ApplicationController
  layout 'usersetting'
  before_filter :auth_user

  def index
    @carts = Cart
      .page(params[:page] || 1)
      .per_page(params[:per_page] || 10)
      .order("id desc")
      .where(user_id: current_user.id)
      .includes(:user,:product)
  end


  def show
  end

  def edit
    @cart = current_user.carts.find params[:id]
  end

  def new
    @cart = Cart.new
  end

  def minus_number
    @cart = current_user.carts.find params[:id]
    if @cart.number >= 2
      @cart.number -= 1
      @cart.save
      flash[:notice] = "数量修改成功"
      redirect_to carts_path
    else
      flash[:notice] = "数量修改失败"
      redirect_to :back
    end
  end

  def add_number
    @cart = current_user.carts.find params[:id]
    @cart.number += 1
    if @cart.save
      flash[:notice] = "数量修改成功"
      redirect_to carts_path
    else
      flash[:notice] = "数量修改失败"
      redirect_to :back
    end
  end

  def create

    @cart = current_user.carts.new(product_id: params[:product_id])

    if @cart.save
      flash[:notice] = "加入购物车成功"
      redirect_to products_path
    else
      flash[:notice] = "添加购物车失败,该商品已经在购物车中"
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
