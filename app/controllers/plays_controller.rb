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
    @game = Game.find(params[:play][:game].to_i)
    @play.user = current_user
    # company.save and game.save if game does not exist
    @play.game = @game
    # raise
    if @play.save
      redirect_to play_path(@play)
    else
      render :new
    end
  end

  def edit
  end

  private

  def play_params
    params.require(:play).permit(:done, :won, :date, :players)
  end
end
