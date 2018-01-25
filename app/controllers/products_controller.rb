class ProductsController < ApplicationController
  def index
    @product = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "El producto fue actualizado"
    redirect_to product_path
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "El producto fue actualizado"
      redirect_to product_path(@product)
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "El producto fue añadido con éxito"
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :summary, :description, :body, :image1, :image2, :image3, :image4)
    end

end
