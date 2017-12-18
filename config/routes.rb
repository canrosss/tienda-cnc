Rails.application.routes.draw do

  get '/contact', to:'pages#contact'
  get '/about', to:'pages#about'
  get '/product', to:'pages#product'
  get '/login', to:'pages#login'

  root :to => 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
