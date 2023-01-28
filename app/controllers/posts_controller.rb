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
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to @post
    else
      respond_to do |format|
        format.html do
          if @post.save
            flash[:notice] = 'Post created successfully'
            redirect_to users_path
          else
            Rails.logger.error(@post.errors.full_messages)
            flash.now[:alert] = 'Post creation failed'
            render :new, locals: { post: @post }
          end
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
