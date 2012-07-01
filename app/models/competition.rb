class Competitions < ActiveRecord::Base
  attr_accessible :first_round, :second_round, :third_round, :quarterfinal_round, :semifinal_round, :final_round

  belongs_to :player

end
