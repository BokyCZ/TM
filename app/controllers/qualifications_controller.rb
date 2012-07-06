class QualificationsController < ApplicationController

  def index
    @qualifications = Qualification.ordered_by_standings
  end

  def show
    @qualification = Qualification.find(params[:id])
  end

  def edit
    @qualification = Qualification.find(params[:id])
  end

  def update
    @qualification = Qualification.find(params[:id])

    if @qualification.update_attributes(params[:qualification])
      redirect_to qualification_path(@qualification)
    else
      render action: "edit"
    end
  end

  def edit_week_1
    @qualifications = Qualification.ordered_by_standings
  end

  def edit_week_2
    @qualifications = Qualification.ordered_by_standings
  end

  def edit_week_3
    @qualifications = Qualification.ordered_by_standings
  end

  def edit_week_4
    @qualifications = Qualification.ordered_by_standings
  end

end
