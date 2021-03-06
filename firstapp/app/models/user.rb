class User < ActiveRecord::Base
  attr_accessor :password
  #attr_accessible :email, :password, :password_confirmation, :age, :address, :first_name, :last_name, :username
  has_many :products, :dependent => :destroy
  has_many :articles, :dependent => :destroy
  has_many :shared_articles, :class_name => "Article", :foreign_key => "user_id", :conditions => "title like '%shared%'"
  has_one :country

  validates :first_name, :presence => true, :length => {:maximum => 20}, :format => {:with => /[a-zA-Z\s]+$/}
  validates :last_name, :presence => true, :length => {:maximum => 20}, :format => {:with => /[a-zA-Z\s]+$/}
  validates :email, :presence => true, :uniqueness => true, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :username, :presence => true, :uniqueness => true
  
  before_save :encrypt_password
  validates :password, :presence => {:on => :create}, :confirmation => true

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def is_admin?
    self.email == "agus_rusty@yahoo.co.id"
  end
end
