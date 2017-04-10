Rails.application.routes.draw do

  devise_for :users
	# Root path
	root 'pages#home'

end
