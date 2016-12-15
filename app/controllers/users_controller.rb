class UsersController < ApplicationController
  	def index
		render 'index'
  	end

  	def create
  		user = User.new(receive_registration)
  		if user.valid?
  			user.save
  			session[:user_id] = user.id
  			redirect_to '/'
  		else
  			flash[:errors] = user.errors
  			redirect_to '/'
  		end
  	end

  	def login
  		user = User.find_by_email(receive_login[:email])
  		if user && user.authenticate(receive_login[:password])
  			session[:user_id] = user.id
  			redirect_to '/'
  		else
  			flash[:errors] = ["Email/Password combination is invalid"]
  			redirect_to :back 
  		end
  	end

  	def show
  	end

  	def edit
  	end

  	def logout
  		session[:user_id] = nil
  		redirect_to '/'
  	end

  	private

  	def receive_registration
  		params.require(:register).permit(:fn, :ln, :email, :password, :password_confirmation)
  	end

  	def receive_login
  		params.require(:login).permit(:email, :password)
  	end

end
