class Posts::CommentsController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        comments = current_user.comment.new(comment_params)
        comments.post_id = post_image.id
        comments.save
        redirect_to post_path(post_image)
    end
    
    def new
        @post = Post.find(params[:post_id])
    end
    private
  
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
  