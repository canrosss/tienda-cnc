class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #Al ponerlos como helpers, estan disponibles para las vistas
  helper_method :current_user, :logged_in?

  def current_user
    #Se trae l id de session, para buscar en la db para conseguir el obj user
    #Si no existe, hace la busqueda si existe no busca
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

  end

  def logged_in?(*args)
    #true si hay un current user
    !!current_user

  end

  def required_user(*args)
    #Si no esta logeado, redirecciona el usuario
    if !logged_in?
      flash[:danger] = "Debes estar logeado para hacer esa acción"
      redirect_to root_path
   end
  end

end
