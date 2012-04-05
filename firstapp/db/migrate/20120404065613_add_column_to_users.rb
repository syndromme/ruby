class AddColumnToUsers < ActiveRecord::Migration
  def up
    add_column :users, :address, :string
    add_column :users, :age, :integer
    add_column :users, :birthday, :date
  end

  def down
    remove_column :users, :address
    remove_column :users, :age
    remove_column :users, :birthday
  end
end
