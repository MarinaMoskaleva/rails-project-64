class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.comments.arrange
    @like_id = @post.likes.find_by(user: current_user)&.id if current_user
    @comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = I18n.t('flash.notice.post_published')
      redirect_to post_path(@post)
    else
      flash[:error] = I18n.t('flash.error.post_unpublished')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
