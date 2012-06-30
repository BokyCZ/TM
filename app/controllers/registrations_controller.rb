class RegistrationsController < ApplicationController

  def index
    @player = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(params[:player])
    @player.qualification = Qualification.new(params[:default])

    if @player.save
      redirect_to registration_path(@player), notice: 'Registrace probehla v poradku'
    else
      render action: "new"
    end
  end

end

