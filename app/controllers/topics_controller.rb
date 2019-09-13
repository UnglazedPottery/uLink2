class TopicsController < ApplicationController
    def index
        @topics = Topic.all
    end

    def new
        @topic = Topic.new
    end

    def create
        # byebug
        @topic = Topic.create({
            name: params[:topic][:name]
        })
        @topic.image.attach(params[:topic][:image])
        redirect_to "/topics"
    end

    def show
        @post = Post.new
        @topic = Topic.find(params[:id])
        @user = User.find_by_id(session[:user_id])
        render 'show'
    end

    # def edit
        
    #     @topic = Topic.find(params[:id])
    # end

    # def update
    #     @topic = Topic.find(params[:id])
    #     @topic.create({name : params[:name]})
    #     redirect_to "/topics/#{@topic.id}"
    # end

    def html
        render 'htmlPage.html.erb'
    end

    def css 
        @topic = Topic.find(params[:id])
        
        render 'cssPage.html.erb'
    end

    def javascript 
        render 'javascriptPage.html.erb'
    end

end
