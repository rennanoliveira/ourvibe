Ourvibe::Application.routes.draw do

  root :to => 'playlists#index'

  resources :spotify_search, :only => :index

end
