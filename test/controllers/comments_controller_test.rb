require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
    @category = categories(:one)
    @parent_comment = post_comments(:with_comments)
    @commert_with_nested = post_comments(:nested)
    @commert_with_deep_nested = post_comments(:deep_nested)
    @attrs = {
      content: Faker::Lorem.paragraph(random_sentences_to_add: 10)
    }
    @nested_attrs = @attrs.merge({ parent_id: @parent_comment.id.to_s })

    sign_in @user
  end

  test "should create comment" do
    post post_comments_url(@post), params: { post_comment: @attrs }

    comment = PostComment.find_by @attrs.merge({ post: @post })

    assert { comment }
    assert_redirected_to @post
  end

  test "should create nested comment" do
    post post_comments_url(@post), params: { post_comment: @nested_attrs }

    comment = PostComment.find do |i|
      i.ancestry == @nested_attrs[:parent_id] && i.post == @post && i.creator == @user
    end

    assert { comment }
    assert_redirected_to @post
  end
end
