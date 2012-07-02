class Qualification < ActiveRecord::Base
  attr_accessible :first, :second, :third, :fourth

  belongs_to :player

  scope :ordered_by_standings, order("standings")
  scope :qualified, order("standings").limit(64)

  def total
    first + second + third + fourth
  end

  def standings
    Qualification.where("total >= ?", total).count
  end

  before_save do
    self.standings = standings
    self.total = total
  end

end
