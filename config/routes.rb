Rails.application.routes.draw do

  resources :posts do
    get 'upvote' => 'posts#upvote', as: :upvote
  end

  resources :comments do
    get 'upvote' => 'comments#upvote', as: :upvote
  end

  resources :companies

  devise_for :users, :controllers => {
  	omniauth_callbacks: "users/omniauth_callbacks",
  	registrations: 'users/registrations'
  }
	# Root path
	root 'pages#home'

  match '/users/:id', :to => 'users#show', :as => :user, via: [:get]

  match '/search', to: 'search#search', via: [:get]
  match '/search/typeahead/:query', to: 'search#typeahead', via: [:get]
  match '/filter', to: 'filters#filter', via: [:post]


end
