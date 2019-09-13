class UsersController < ApplicationController

    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end

    def new
		@user = User.new
	end

	def create
		@user = User.new(username: params[:user][:username], password: params[:user][:password])
		# byebug
		if @user && @user.valid?
			@user.save
			session[:current_user_id] = @user.id
			redirect_to "/users/#{@user.id}"
		else
			puts "faaaaaaaaaail!"
			flash.now[:alert] = "Username must be unique, no blanks."
			render "new"
		end
	end

	# def login
	# end
	
	def authenticate
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
	
	# def destroy
	# 	session[:current_user_id] = nil
	# 	redirect_to root_url, notice: "Logged out!"
	# end

	# def edit
	# 	@user = User.find(params[:id])
	# end

	# def update
	#   @user = User.find(params[:id])
	#   @user.update(user_params)
	#   redirect_to user_path(@user)
	# end

	private

		def user_params
			params.require(:user).permit(:username, :password)
		end
end