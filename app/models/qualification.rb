class Qualification < ActiveRecord::Base
  attr_accessible :first, :second, :third, :fourth

  belongs_to :player

  validates :first,   :presence => true, :numericality => {:only_integer => true, :greater_than => 0}
  validates :second,  :presence => true, :numericality => {:only_integer => true, :greater_than => 0}
  validates :third,   :presence => true, :numericality => {:only_integer => true, :greater_than => 0}
  validates :fourth,  :presence => true, :numericality => {:only_integer => true, :greater_than => 0}

  scope :ordered_by_standings, order("standings")

  def total
    first + second + third + fourth
  end

  def standings
    Qualification.where("total >= ?", total).count
  end

  before_save do
    self.total = total
    self.standings = standings
  end

  before_update do
    self.total = total
    self.standings = standings
  end

end
