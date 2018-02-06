class CategoriesController < ApplicationController

  def index
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "La categoria fue creada con éxito"
      redirect_to categories_path

    else
      render 'new'
    end

  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end

end
