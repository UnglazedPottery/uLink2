class PostsController < ApplicationController

    def index
        @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
    end

	def create
		# byebug
		@post = Post.create({
            likes: 0,
            topic_id: params[:id],
            url: params[:post][:url],
			note: params[:post][:note],
			user_id: session[:current_user_id]
		})
		
	  redirect_to "/topics/#{params[:id]}"
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
      @post.update({
		  url: params[:post][:url],
		  note: params[:post][:note]
		})

      @post.save
	  redirect_to post_path(@post)
	end

	def heart
		@post = Post.find(params[:id])
		x = @post.likes
		@post.likes = x + 1
		puts @post.likes
		puts "---------------------------------------------"
		@post.save
		redirect_to "/topics/#{@post.topic.id}"
	end

        
end
