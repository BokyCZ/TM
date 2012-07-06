module CompetitionsHelper

  def first_to_second_round(drawOne, drawTwo)
    this_to_next_round(drawOne.first_round, drawTwo.first_round, drawOne.player.qualification.standings, drawTwo.player.qualification.standings, drawOne.second_round)
  end

  def second_to_third_round(drawOne, drawTwo)
    this_to_next_round(drawOne.second_round, drawTwo.second_round, drawOne.player.qualification.standings, drawTwo.player.qualification.standings, drawOne.third_round)
  end

  def third_to_quarterfinal_round(drawOne, drawTwo)
    this_to_next_round(drawOne.third_round, drawTwo.third_round, drawOne.player.qualification.standings, drawTwo.player.qualification.standings, drawOne.quarterfinal_round)
  end

  def quarterfinal_to_semifinal_round(drawOne, drawTwo)
    this_to_next_round(drawOne.quarterfinal_round, drawTwo.quarterfinal_round, drawOne.player.qualification.standings, drawTwo.player.qualification.standings, drawOne.semifinal_round)
  end

  def semifinal_to_final_round(drawOne, drawTwo)
    this_to_next_round(drawOne.semifinal_round, drawTwo.semifinal_round, drawOne.player.qualification.standings, drawTwo.player.qualification.standings, drawOne.final_round)
  end

  def this_to_next_round(drawOne, drawTwo, totalOne, totalTwo, nextOne)
    if drawOne < drawTwo
      0
    else
      if drawOne > drawTwo
        if nextOne > 1
          nextOne
        else
          1
        end
      else
        if totalOne < totalTwo
          if nextOne > 1
            nextOne
          else
            1
          end
        else
          0
        end
      end
    end
  end

  def generate_draws
    Competition.destroy_all
    no =  [1..64].map{|i| i.to_a}.flatten
    @players = Player.all
    @players.each do |player|
      if player.qualification.standings < 65
        index  = (1..1).map{ no[rand(no.length)] }.join
        index = index.to_i
        player.competition = Competition.new(:draw => index)
        pole = [index]
        no = no - pole
      end
    end
  end

  def padding(n)
    n = n + 1
    if (n % 2) == 1
      1
    else
      2
    end
  end

  def color_and_comparison_first(drawOne, drawTwo)
    color_and_comparison(drawOne.first_round, drawTwo.first_round, drawOne.player.qualification.standings, drawTwo.player.qualification.standings)
  end

  def color_and_comparison_second(drawOne, drawTwo)
    color_and_comparison(drawOne.second_round, drawTwo.second_round, drawOne.player.qualification.standings, drawTwo.player.qualification.standings)
  end

  def color_and_comparison_third(drawOne, drawTwo)
    color_and_comparison(drawOne.third_round, drawTwo.third_round, drawOne.player.qualification.standings, drawTwo.player.qualification.standings)
  end

  def color_and_comparison_quarterfinal(drawOne, drawTwo)
    color_and_comparison(drawOne.quarterfinal_round, drawTwo.quarterfinal_round, drawOne.player.qualification.standings, drawTwo.player.qualification.standings)
  end

  def color_and_comparison_semifinal(drawOne, drawTwo)
    color_and_comparison(drawOne.semifinal_round, drawTwo.semifinal_round, drawOne.player.qualification.standings, drawTwo.player.qualification.standings)
  end

  def color_and_comparison_final(drawOne, drawTwo)
    color_and_comparison(drawOne.final_round, drawTwo.final_round, drawOne.player.qualification.standings, drawTwo.player.qualification.standings)
  end

  def color_and_comparison(drawOne, drawTwo, totalOne, totalTwo)
    if drawOne < drawTwo
      0
      else
        if drawOne > drawTwo
          1
        else
          if totalOne < totalTwo
            1
          else
            0
          end
        end
    end
  end

end



def first_to_second_round(drawOne, drawTwo)
  if drawOne.first_round > drawTwo.first_round
    1
  else
    if drawOne.first_round == drawTwo.first_round
      1
    else
      0
    end
  end
end

def first_to_second_round2(drawOne, drawTwo)
  if drawOne.first_round > drawTwo.first_round
    1
  else
    0
  end
end

def competition_check
  @competitions = Competition.ordered_for_first_round
  for n in 1..32
    draw1 = @competitions[(2*n) - 2]
    draw2 = @competitions[(2*n) - 1]
    draw1.second_round = first_to_second_round(draw1, draw2)
    draw2.second_round = first_to_second_round(draw2, draw1)
    draw1.save
    draw2.save
  end
  @competitions = Competition.ordered_for_second_round
  for n in 1..16
    draw1 = @competitions[(2*n) - 2]
    draw2 = @competitions[(2*n) - 1]
    draw1.third_round = second_to_third_round(draw1, draw2)
    draw2.third_round = second_to_third_round(draw2, draw1)
    draw1.save
    draw2.save
  end
  @competitions = Competition.ordered_for_third_round
  for n in 1..8
    draw1 = @competitions[(2*n) - 2]
    draw2 = @competitions[(2*n) - 1]
    draw1.quarterfinal_round = third_to_quarterfinal_round(draw1, draw2)
    draw2.quarterfinal_round = third_to_quarterfinal_round(draw2, draw1)
    draw1.save
    draw2.save
  end
  @competitions = Competition.ordered_for_quarterfinal_round
  for n in 1..4
    draw1 = @competitions[(2*n) - 2]
    draw2 = @competitions[(2*n) - 1]
    draw1.semifinal_round = quarterfinal_to_semifinal_round(draw1, draw2)
    draw2.semifinal_round = quarterfinal_to_semifinal_round(draw2, draw1)
    draw1.save
    draw2.save
  end
  @competitions = Competition.ordered_for_semifinal_round
  for n in 1..2
    draw1 = @competitions[(2*n) - 2]
    draw2 = @competitions[(2*n) - 1]
    draw1.final_round = semifinal_to_final_round(draw1, draw2)
    draw2.final_round = semifinal_to_final_round(draw2, draw1)
    draw1.save
    draw2.save
  end
end