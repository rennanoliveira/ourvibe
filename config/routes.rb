Ourvibe::Application.routes.draw do

   root :to => 'home#index'

  resources :spotify_search, :only => :index

end
