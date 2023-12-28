class Posts::LikesController < Posts::ApplicationController
  before_action :authenticate_user!

  def create
    resource_post.likes.create(user: current_user) unless resource_post.likes.exists?(user: current_user)
    redirect_to post_path(resource_post)
  end

  def destroy
    @like = PostLike.find params[:id]
    return if @like.blank?

    post = @like.post
    @like.destroy
    redirect_to post_path(post)
  end
end
