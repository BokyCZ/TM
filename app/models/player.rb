class Player < ActiveRecord::Base
  attr_accessible :name, :team, :sex, :age

  has_one :qualification, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true
  validates :team, :presence => true, :uniqueness => true
  validates :sex,  :presence => true
  validates :age,  :presence => true

end
