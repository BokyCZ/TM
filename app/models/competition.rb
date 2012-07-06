class Competition < ActiveRecord::Base
  attr_accessible :first_round, :second_round, :third_round, :quarterfinal_round, :semifinal_round, :final_round, :draw

  belongs_to :player

  validates :first_round,  :presence => true, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0, :less_than => 1000}
  validates :second_round,  :presence => true, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0, :less_than => 1000}
  validates :third_round,  :presence => true, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0, :less_than => 1000}
  validates :quarterfinal_round,  :presence => true, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0, :less_than => 1000}
  validates :semifinal_round,  :presence => true, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0, :less_than => 1000}
  validates :final_round,  :presence => true, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0, :less_than => 1000}

  scope :ordered_for_first_round, order("draw")
  scope :ordered_for_second_round, order("draw").having("second_round > ?", 0)
  scope :ordered_for_third_round, order("draw").having("third_round > ?", 0)
  scope :ordered_for_quarterfinal_round, order("draw").having("quarterfinal_round > ?", 0)
  scope :ordered_for_semifinal_round, order("draw").having("semifinal_round > ?", 0)
  scope :ordered_for_final_round, order("draw").having("final_round > ?", 0)

end