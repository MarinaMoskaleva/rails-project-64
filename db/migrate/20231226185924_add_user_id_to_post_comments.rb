class AddUserIdToPostComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :post_comments, :creator, foreign_key: { to_table: :users }
  end
end
