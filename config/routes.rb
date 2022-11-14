Rottenpotatoes::Application.routes.draw do
  # get 'users/new'

  # get 'users/show'

  # get 'users/create'

  get 'sessions/new'

  resources :users, only: [:new, :create, :show]

  resources :events
  # map '/' to be a redirect to '/movies'
  # root :to => redirect('/events')
  root :to => redirect('/login')

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
