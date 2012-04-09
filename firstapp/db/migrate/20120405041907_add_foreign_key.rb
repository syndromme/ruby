class AddForeignKey < ActiveRecord::Migration
  def up
    add_column :products, :user_id, :integer
    add_column :comments, :article_id, :integer
    add_column :articles, :user_id, :integer
    add_column :users, :country_id, :integer
  end

  def down
    remove_column :products, :user_id
    remove_column :comments, :article_id
    remove_column :articles, :user_id
    remove_column :users, :country_id
  end
end
