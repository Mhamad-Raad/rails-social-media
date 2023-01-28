class LikesController < ApplicationController
    def create
    like_params = params.require(:new_like).permit(:post_id, :author_id)
    like = Like.new
    like.posts_id = like_params[:post_id]
    like.author_id = like_params[:author_id]
    like.post = Post.find(like_params[:post_id])
        if like.save
          flash.now[:notice] = 'Like created successfully'
        else
          flash.now[:alert] = 'Like creation failed'
        end
        redirect_to user_post_path(like.post.author_id, like.post.id)
  end
end
