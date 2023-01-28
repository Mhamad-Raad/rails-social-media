class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.new
    respond_to do |format|
    format.html { render :new, locals: { post: @post } }
  end
  end

def create
    @comment = Comment.new(text: comment_params[:text])
    @comment.author_id = comment_params[:author_id]
    @comment.posts_id = comment_params[:post_id]
    if @comment.save
      flash[:notice] = 'Comment created successfully'
      render :new
    else
      flash.now[:alert] = 'Post creation failed'
      redirect_to :ew
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :post_id, :author_id)
  end
end
