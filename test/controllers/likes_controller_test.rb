require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)

    sign_in @user
  end
  test "should create like" do
    post post_likes_path(@post)

    like = PostLike.find_by({ post: @post, user: @user })

    assert { like }
    assert_redirected_to post_url(@post)
  end

  test "should destroy like" do
    like = post_likes(:one)
    delete like_path(like)
    assert { @post.likes.find_by(id: like.id).nil? }
    assert_redirected_to post_url(@post)
  end
end
