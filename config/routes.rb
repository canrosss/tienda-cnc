Rails.application.routes.draw do

  get '/contact', to:'pages#contact'
  get '/about', to:'pages#about'
#  get '/login', to:'pages#login'


  get '/signup', to:'users#new'
  resources :users, except: [:new]

  #Simula login
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root :to => 'pages#home'

  resources :products

  resources :categories, except: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
