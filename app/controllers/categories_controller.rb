class CategoriesController < ApplicationController
  before_action :get_category, :only => [:show, :edit, :update, :destroy]

  def show
    @products = @category.products.all.page(params[:page]).per(10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_param)

    if @category.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_param)
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy

    redirect_to root_path
  end

  private
    def category_param
      params.require(:category).permit(:name)
    end

    def get_category
      @category = Category.find(params[:id])
    end
end
