class AddLikesCountToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :likes_counts, :integer, default: 0
  end
end
