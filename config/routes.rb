Rails.application.routes.draw do
 

  devise_for :users
  resources :users
	root to: "home#index"
  get '/tickets/details' => 'tickets#details'
  get '/tickets/:ticker' => 'tickets#chart'
  delete '/tickets/:ticker' => 'tickets#destroy', as: :delete_ticker 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
