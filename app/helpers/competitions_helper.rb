module CompetitionsHelper

  def colorCompetitionClass(drawOne, drawTwo)

    if drawOne.first_round < drawTwo.first_round
      1
    else
      0
    end
  end

end
