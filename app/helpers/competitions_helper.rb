module CompetitionsHelper

  def first_to_second_round1(drawOne, drawTwo)
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
