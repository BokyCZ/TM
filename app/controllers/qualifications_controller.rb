class QualificationsController < ApplicationController

  def index
    @qualifications = Qualification.ordered_by_standings
  end

  def show
  end

  def update
  end

  def edit
  end

end
