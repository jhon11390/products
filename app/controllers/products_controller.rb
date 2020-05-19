class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @product.categories = params[:categories]
    if @product.save
      redirect_to :products
    else
      render :new
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy

    redirect_to :products
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :categories)
    end
end
