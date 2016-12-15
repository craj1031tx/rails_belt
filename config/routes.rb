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

	#shoes 
	get '/shoes' => 'store#shoe_store'
	post '/shoes/add_shoe' => 'store#add_shoe'
	get '/dashboard/:id' => 'store#dashboard'

	#shoes variable...	
	get '/shoes/remove_shoe/:id' => 'store#remove_shoe'
	get '/shoes/buy_shoe/:id' => 'store#buy_shoe'


end
