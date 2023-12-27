class Posts::LikesController < Posts::ApplicationController
  before_action :authenticate_user!

  def create
    resource_post.post_likes.create(user: current_user)
    redirect_to post_path(resource_post)
  end

  def destroy
    @like = PostLike.find params[:id]

    post = @like.post
    @like.destroy
    redirect_to post_path(post)
  end
end
