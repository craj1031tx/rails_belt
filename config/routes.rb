Rails.application.routes.draw do
	root 'users#index'

	#users... 
	get 'users/index'
	get 'users/show'
	get 'users/edit'
	post '/users/create' => 'users#create'
	delete '/users/logout' => 'users#logout'
	post '/users/login' => 'users#login'

	#users variable....


end
