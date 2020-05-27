class GamesController < ApplicationController
  def index
    @companies = Company.all.order(:name)
    # @games = Game.all.order(:name)
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :rating, :company_id, :price, photos: [])
  end
end
