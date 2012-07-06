class RegistersController < ApplicationController

  def index
    @players = Player.ordered_by_name
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def edit
    @player = Player.find(params[:id])
  end

  def create
    @player = Player.new(params[:player])
    @player.qualification = Qualification.new(params[:default])

    if @player.save
      redirect_to register_path(@player) #, notice: 'Registrace probehla v poradku'
    else
      render action: "new"
    end
  end

  def update
    @player = Player.find(params[:id])

    if @player.update_attributes(params[:player])
      redirect_to register_path(@player) #, notice: 'Uspesne upraveno.' }
    else
      render action: "edit"
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to registers_path
  end

end

