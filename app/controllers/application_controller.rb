class ApplicationController < ActionController::Base
  	def current_user
  		User.find(session[:user_id]) if session[:user_id]
  	end

  	def require_login
  		redirect_to '/' if session[:user_id] == nil
  	end


  	helper_method :current_user, :require_login  
  	protect_from_forgery with: :exception
end
