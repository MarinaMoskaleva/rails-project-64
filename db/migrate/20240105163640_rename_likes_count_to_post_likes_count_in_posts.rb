class RenameLikesCountToPostLikesCountInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :likes_count, :post_likes_count
  end
end
