class User < ActiveRecord::Base
  has_many :products, :dependent => :destroy
  has_many :articles, :dependent => :destroy
  has_many :shared_articles, :class_name => "Article", :foreign_key => "user_id", :conditions => "title like '%shared%'"
  has_one :country

  validates :first_name, :presence => true, :length => {:maximum => 20}, :format => {:with => /[a-zA-Z\s]+$/}
  validates :last_name, :presence => true, :length => {:maximum => 20}, :format => {:with => /[a-zA-Z\s]+$/}
  validates :email, :presence => true, :uniqueness => true, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :username, :presence => true, :uniqueness => true

  def full_name
    "#{first_name} #{last_name}"
  end
end
