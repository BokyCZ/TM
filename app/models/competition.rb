class Competition < ActiveRecord::Base
  attr_accessible :first_round, :second_round, :third_round, :quarterfinal_round, :semifinal_round, :final_round, :draw

  belongs_to :player

  scope :ordered_for_first_round, order("draw")
  scope :ordered_for_second_round, order("draw").having("second_round > ?", 0)
  scope :ordered_for_third_round, order("draw").having("third_round > ?", 0)
  scope :ordered_for_quarterfinal_round, order("draw").having("quarterfinal_round > ?", 0)
  scope :ordered_for_semifinal_round, order("draw").having("semifinal_round > ?", 0)
  scope :ordered_for_final_round, order("draw").having("final_round > ?", 0)

end
