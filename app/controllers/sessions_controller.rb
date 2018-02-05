class SessionsController < ApplicationController
  def new

  end

  #Login
  def create
    debugger
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:succes] = "Te has logeado exitosamente"
      redirect_to users_path(user)
    else
      flash.now[:danger] = "Hay algo mal con tu inicio de sesion"
      render 'new'
    end

  end

  #Stop session
  def destroy
  end
end
