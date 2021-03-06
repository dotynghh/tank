class Admin::ProductsController < Admin::BaseController
	
  def index
    @products = Product
    	.page(params[:page] || 1)
    	.per_page(params[:per_page] || 10)
    	.order("id desc")
      .includes(:user)
  end

  def new
    @product = Product.new
  end

  def show
    @product =  Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    @product.attributes = product_attr
    if @product.save
      flash[:notice] = "商品更新成功"
      redirect_to admin_products_path
    else
      flash[:notice] = "商品更新失败"
      render action: :show
    end
  end

  def create
    @product = Product.new(product_attr)
    if @product.save
    	flash[:notice] = "产品添加成功"
    	redirect_to admin_products_path
    else
    	flash[:notice] = "产品添加失败"
    	render action: :new
    end
  end

  def destroy
  	@product = Product.find params[:id]
  	if @product.destroy
  		flash[:notice] = "删除产品成功"
  		redirect_to admin_products_path
  	else
  		flash[:notice] = "删除产品失败"
  		redirect_to :back
  	end
  end

  private

  def product_attr
  	params.require(:product).permit(:product_name, :description, :price, :inventory)
  end
end
