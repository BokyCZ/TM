class Player < ActiveRecord::Base
  attr_accessible :name, :team, :sex, :age

  has_one :qualification, :dependent => :destroy
  has_one :competition,   :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true
  validates :team, :presence => true, :uniqueness => true
  validates :sex,  :presence => true
  validates :age,  :presence => true, :numericality => {:only_integer => true, :greater_than => 5, :less_than => 100}

  scope :ordered_by_name, order("name")

end
