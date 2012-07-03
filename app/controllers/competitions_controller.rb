class CompetitionsController < ApplicationController

  def index
  end

  def first
    @competitions = Competition.ordered_for_first_round
  end

  def second
    @competitions = Competition.ordered_for_second_round
  end

  def third
    @competitions = Competition.ordered_for_third_round
  end

  def quarterfinal
    @competitions = Competition.ordered_for_quarterfinal_round
  end

  def semifinal
    @competitions = Competition.ordered_for_semifinal_round
  end

  def final
    @competitions = Competition.ordered_for_final_round
  end

end
