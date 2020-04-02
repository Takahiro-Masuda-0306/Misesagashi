class ApplicationController < ActionController::Base
	
	include SessionsHelper
	include RestaurantsHelper
	
	def require_user_logged_in 
		unless logged_in?
			redirect_to root_url
		end
	end

end
