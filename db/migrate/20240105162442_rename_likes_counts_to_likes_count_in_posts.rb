class RenameLikesCountsToLikesCountInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :likes_counts, :likes_count
  end
end
