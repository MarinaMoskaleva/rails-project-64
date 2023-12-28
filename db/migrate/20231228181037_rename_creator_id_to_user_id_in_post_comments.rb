class RenameCreatorIdToUserIdInPostComments < ActiveRecord::Migration[7.1]
  def change
    rename_column :post_comments, :creator_id, :user_id
  end
end
