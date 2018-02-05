class SessionsController < ApplicationController
  def new

  end

  #Login
  def create
#    debugger
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Te has logeado exitosamente"
      redirect_to products_path()
    else
      flash.now[:danger] = "Hay algo mal con tu inicio de sesion"
      render 'new'
    end

  end

  #Stop session
  def destroy
    session[:user_id] = nil
    flash[:success] = "Te has deslogeado con éxito"
    redirect_to root_path
  end
end
