class RegistrationsController < ApplicationController

  def index
    @player = Player.all
    @qualification = Qualification.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
    @qualification = Qualification.new
  end

  def create
    @player = Player.new(params[:player])
    @qualification = Qualification.new(params[:default])

    if @player.save
      if @qualification.save
        redirect_to registration_path(@player), notice: 'Registrace probehla v poradku'
      end
    else
      redirect_to new_registration_path, notice: 'Registrace byla neuspesna, opakujte vasi zadost'
    end
  end

end
