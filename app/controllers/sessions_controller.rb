class SessionsController < ApplicationController

    def new
	end
	
	def create
		@user = User.find_by({ username: params[:username] })
		# byebug
        if @user && @user.authenticate(params[:password])#&& @user.valid?
            session[:current_user_id] = @user.id
			redirect_to "/users/#{@user.id}"
		else
			flash.now[:alert] = "Email or password is invalid"
			render 'login'
        end
	end
	
	def destroy
		session[:current_user_id] = nil
		redirect_to root_url, notice: "Logged out!"
    end
    
  end