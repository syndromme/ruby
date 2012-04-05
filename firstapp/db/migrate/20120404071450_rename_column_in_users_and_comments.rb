class RenameColumnInUsersAndComments < ActiveRecord::Migration
  def up
    rename_column :users, :user_name, :username
    rename_column :comments, :body, :content
  end

  def down
    rename_column :users, :username, :user_name
    rename_column :comments, :content, :body
  end
end
