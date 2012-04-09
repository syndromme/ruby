class Country < ActiveRecord::Base
  belongs_to :user
  validate :invalid_code
  validates :name, :presence => true, :length => {:maximum => 15}

  def invalid_code
    self.errors[:code] << "Only input 'id', 'usa', 'frc'" unless code == 'id' or code == 'usa' or code == 'frc'
  end
end
