Rails.application.routes.draw do

  resources :posts do
    get 'upvote' => 'posts#upvote', as: :upvote
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	# Root path
	root 'pages#home'

  match '/users/:id', :to => 'users#show', :as => :user, via: [:get]

end
