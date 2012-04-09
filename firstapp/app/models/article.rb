class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  belongs_to :user
  validates :title, :presence => true, :uniqueness => true

  scope :rating_is_and_above, lambda {|rate| where("rating = ?", rate) }
end
