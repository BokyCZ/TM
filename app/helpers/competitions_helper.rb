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
    if drawOne.first_round < drawTwo.first_round
      0
    else
      1
    end
  end

  def color_and_comparison_second(drawOne, drawTwo)
    if drawOne.second_round < drawTwo.second_round
      0
    else
      1
    end
  end

  def color_and_comparison_third(drawOne, drawTwo)
    if drawOne.third_round < drawTwo.third_round
      0
    else
      1
    end
  end

  def color_and_comparison_quarterfinal(drawOne, drawTwo)
    if drawOne.quarterfinal_round < drawTwo.quarterfinal_round
      0
    else
      1
    end
  end

  def color_and_comparison_semifinal(drawOne, drawTwo)
    if drawOne.semifinal_round < drawTwo.semifinal_round
      0
    else
      1
    end
  end

  def color_and_comparison_final(drawOne, drawTwo)
    if drawOne.final_round < drawTwo.final_round
      0
    else
      1
    end
  end

end
