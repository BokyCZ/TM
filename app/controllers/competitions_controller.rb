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

  def generate_competition
  end

  def check_competition
  end

  def edit_first
    @competition = Competition.find(params[:id])
  end

  def edit_second
    @competition = Competition.find(params[:id])
  end

  def edit_third
    @competition = Competition.find(params[:id])
  end

  def edit_quarterfinal
    @competition = Competition.find(params[:id])
  end

  def edit_semifinal
    @competition = Competition.find(params[:id])
  end

  def edit_final
    @competition = Competition.find(params[:id])
  end

  def update_first
    @competition = Competition.find(params[:id])

    if @competition.update_attributes(params[:competition])
      redirect_to first_competitions_path
    else
      render action: "edit_first"
    end
  end

  def update_second
    @competition = Competition.find(params[:id])

    if @competition.update_attributes(params[:competition])
      redirect_to second_competitions_path
    else
      render action: "edit_second"
    end
  end

  def update_third
    @competition = Competition.find(params[:id])

    if @competition.update_attributes(params[:competition])
      redirect_to third_competitions_path
    else
      render action: "edit_third"
    end
  end

  def update_quarterfinal
    @competition = Competition.find(params[:id])

    if @competition.update_attributes(params[:competition])
      redirect_to quarterfinal_competitions_path
    else
      render action: "edit_quarterfinal"
    end
  end

  def update_semifinal
    @competition = Competition.find(params[:id])

    if @competition.update_attributes(params[:competition])
      redirect_to semifinal_competitions_path
    else
      render action: "edit_semifinal"
    end
  end

  def update_final
    @competition = Competition.find(params[:id])

    if @competition.update_attributes(params[:competition])
      redirect_to final_competitions_path
    else
      render action: "edit_final"
    end
  end

end
