Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  to: 'pages#home'
  get 'explore/:page', to: 'pages#explore'

  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'login/', to: 'session#destroy'
end
