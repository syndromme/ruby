class ChangeColumnInCountriesAndArticles < ActiveRecord::Migration
  def up
    change_column :countries, :code, :string
    change_column :articles, :body, :text
  end

  def down
    change_column :countries, :code, :int
    change_column :articles, :body, :string
  end
end
