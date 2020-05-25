class PlaysController < ApplicationController
  def index
    @plays = Play.all
  end

  def show
    @play = Play.find(params[:id])
  end

  def new
    @play = Play.new
    @new_game = Game.new
  end

  def create
    @play = Play.new(play_params)
    @play.user = current_user
    # company.save and game.save if game does not exist
    if @play.save
      redirect_to play_path(@play)
    else
      render :new
    end
  end

  def edit
    @play = Play.find(params[:id])
    @new_game = Game.new
  end

  def update
    @play = Play.find(params[:id])
    if @play.update(play_params)
      redirect_to play_path(@play)
    else
      render :edit
    end
  end

  private

  def play_params
    params.require(:play).permit(:done, :won, :date, :game_id, :players, photos: [])
  end
end
