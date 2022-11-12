Rottenpotatoes::Application.routes.draw do
  resources :events
  # map '/' to be a redirect to '/movies'
  # root :to => redirect('/events')
  root :to => redirect('/login')

  resources :users, only: [:new, :create, :edit, :show, :destroy]
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end
