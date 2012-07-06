class QualificationsController < ApplicationController

  def index
    @qualifications = Qualification.ordered_by_standings
  end

  def edit
    @qualification = Qualification.find(params[:id])
  end

  def update
    @qualification = Qualification.find(params[:id])

    if @qualification.update_attributes(params[:qualification])
      redirect_to qualifications_path
    else
      render action: "edit"
    end
  end

end
