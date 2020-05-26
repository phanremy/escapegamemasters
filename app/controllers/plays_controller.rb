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
      Participation.create(play: @play, user: current_user)
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

  def add_players
    @play = Play.find(params[:play_id])
    @player = User.find_by(first_name: params[:player])
    if @player
      Participation.create(play: @play, user: @player)
      @response = "Player found"
    else
      Participation.create(play: @play, optional_name: params[:player])
      @response = "Player not found, added dummy player"
    end
    render :show
  end

  def add_photos
  end

  def delete_photo
    @play = Play.find(params[:id])
    @play.photos.find(params[:format]).purge
    redirect_to play_path(@play)
    # redirect_back(fallback_location: request.referer)
  end

  private

  def play_params
    params.require(:play).permit(:done, :won, :date, :game_id, photos: [])
  end
end
