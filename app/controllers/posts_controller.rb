class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])
    comment = Comment.new
    like = Like.new
    respond_to do |format|
      format.html { render :show, locals: { comment:, like: } }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0

    @post = Post.new(post_params)
    @post.author = current_user

    @post.save
    redirect_to user_posts_path(current_user)
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to user_path(current_user.id), notice: 'Post deleted successfully'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
