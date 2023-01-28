class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])

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
      @post = Post.new
      # redirect to the same page
      redirect_to user_post_path(@comment.author_id, @comment.post.id)

    else
      flash.now[:alert] = 'Post creation failed'
      redirect_to user_post_path(@post.author_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id, :author_id)
  end
end
