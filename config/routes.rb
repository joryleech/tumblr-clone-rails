Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  to: 'pages#home'


  get 'explore/:page', to: 'pages#explore', as: 'explore'

  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'login', to: 'session#destroy'

  get 'posts/:id', to: 'posts#view', as: 'posts'
  get 'posts/new/:type', to: 'posts#new', as: "posts_new"
  post 'posts/new/:type', to: 'posts#create'
  delete 'posts/:id', to: 'posts#delete'
end
