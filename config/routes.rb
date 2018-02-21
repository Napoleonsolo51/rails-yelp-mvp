Rails.application.routes.draw do
	root({ to: "restaurants#index" })

  resources :restaurants do 
  	resources :reviews, only: [:new, :create]

  	collection do
  		get "/top", to: "restaurants#top"
  	end

  	member do 
  		get '/chef', to: "restaurants#chef"
  	end

  end

end
