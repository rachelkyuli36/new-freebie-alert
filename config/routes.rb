Rottenpotatoes::Application.routes.draw do
  # get 'users/new'

  # get 'users/show'

  # get 'users/create'
  resources :events do
    resources :likes
  end

  get 'sessions/new'

  #citation: https://gorails.com/blog/how-to-add-a-page-to-your-rails-app
  
  #get "share", to: "events#share"

  resources :users, only: [:new, :create, :show, :destroy]

  resources :events
  # map '/' to be a redirect to '/movies'
  # root :to => redirect('/events')
  root :to => redirect('/login')

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
