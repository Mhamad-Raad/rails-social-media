class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).order(created_at: :desc)
  end

  def show
    @user = current_user
    @post = Post.where(author_id: current_user.id).find(params[:id])
  end

  def new
    new_post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: new_post } }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    p current_user
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
