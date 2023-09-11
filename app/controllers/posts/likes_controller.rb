class Posts::LikesController < ApplicationController
    before_action :set_post
  
    def create
      @post.likes.create(user: current_user)
      redirect_to root_url
    end
  
    def destroy
      @post.likes.find_by(user: current_user).destroy
      redirect_to root_url
    end
  
    private
  
    def set_post
      @post = Post.find(params[:post_id])
    end
  end