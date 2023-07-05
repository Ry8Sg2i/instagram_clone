class ArticlesController < ApplicationController

  def show
    @posts = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  

  def create
    @posts = Post.new(article_params)

    if @posts.save
      redirect_to post_url(@posts), notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:post).permit(:description, :user)
  end
end