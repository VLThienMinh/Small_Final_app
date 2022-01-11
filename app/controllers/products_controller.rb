class ProductsController < ApplicationController
  def home
    @products = Product.last(6)
  end

  def new
    @product = Product.new
    @categories = Category.all.order(:name)
  end

  def create
    @product = Product.new(product_params)
    # @product.category_id = params[:category_id]

    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])

  end

  def update
    @poduct = Product.find(params[:id])
    @product.category_id = params[:category_id]

    if @product.update(product_params)
      redirect_to @root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  

  private
    def product_params
      params.require(:product).permit(:name, :new_price, :old_price, :category_id, :photo)
    end
end
