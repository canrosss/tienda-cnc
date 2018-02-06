class ProductsController < ApplicationController

  # se asegura que seas un user, para usar las acciones CRUD, EDIT, UPDATE, DESTROY, CREATE
  before_action :ensure_user, only: [:edit, :update, :destroy, :create]

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
    #  redirect_to product_path(@product) if logged_in?
      redirect_to product_path(@product)

    end
  end

  def create
    @product = Product.new(product_params)
    #Es para asegurar que cada producto creado tenga un usuario que es el primero de la tabla*
    @product.user = User.first
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

    def set_product
      @product = Product.find(params[:id])
    end

    def ensure_user
      if current_user.nil?
        flash[:notice] = ("solo usuarios")
        redirect_to root_path
        return true
      else
        false
      end

    end

end
