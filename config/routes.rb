Rottenpotatoes::Application.routes.draw do
  resources :events
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/events')
end
