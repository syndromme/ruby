class Category < ActiveRecord::Base
  has_many :products, :through => :categoriesproducts
  has_many :categoriesparts
end
