class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  

  def create
    @post = Post.new(post_params)

    @post.user_id = 1
    if @post.save
      redirect_to post_url(@post), notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, :thumbnail)
  end
end