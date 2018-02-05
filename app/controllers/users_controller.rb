class UsersController < ApplicationController
  def new(*args)
    @user = User.new
  end

  def create(*args)
#    debugger
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Bienvenido a TiendaCNC"
      redirect_to products_path
    else
      render 'new'
    end

  end

  private
  def user_params(*args)
    params.require(:user).permit(:username, :email, :password)
  end
end
