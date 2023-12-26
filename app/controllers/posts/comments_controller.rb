class Posts::CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = PostComment.new(comment_params)
    @comment.post = @post
    # @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:notice] = I18n.t('flash.notice.comment_published')
    else
      flash[:error] = I18n.t('flash.error.comment_unpublished')
    end
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
