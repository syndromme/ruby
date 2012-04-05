class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  belongs_to :user

  scope :rating_is_and_above, lambda {|rate| where("rating = ?", rate) }
end
