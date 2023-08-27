class PostsController < ApplicationController
    before_action :authenticate_user!
    def index
      @posts = Post.all
    end
  
    def new
      render :new # renders app/views/posts/new.html.erb
    end
  
    # このActionを追加
    def create
      redirect_to new_post_path # redirects to GET "/posts/new"
    end
end
