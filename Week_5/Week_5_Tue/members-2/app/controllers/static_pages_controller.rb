class StaticPagesController < ApplicationController
	def home
	end

	def secret_page
		if !logged_in?
			flash[:danger] = 'Loggue toi pour accéder à la page'
			redirect_to root_path
		end
	end 
end
