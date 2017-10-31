class UsersController < ApplicationController

def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
		log_in @user
		redirect_to root_path
	else
		render 'new'
	end
end
	
	def edit
		@user = User.find(params[:id])
		if user != current_user
			flash[:danger] = 'You cannot edit someone else'
			redirect_to users_path
		end
	end

	def update
		@user = User.find(params[:id])
    		if @user.update(user_params)
      		redirect_to users_path
    		else
      		render 'Edit'
    		end
    end

private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end

