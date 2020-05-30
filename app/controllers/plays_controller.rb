class PlaysController < ApplicationController
  autocomplete :game, :name, full: true


  def index
    @plays = Play.all
  end

  def show
    @play = Play.includes(messages: :user).find(params[:id])
    @participants = @play.participations.map(&:user_id)
    @users = User.all.reject { |u| @participants.include?(u.id) }
  end

  def new
    @play = Play.new
    # @game = Game.new
    @games = Game.all
    # raise
  end

  def create
    @play = Play.new(play_params)
    @play.user = current_user
    @play.game_id = params[:game][5..-1].to_i
    unless @play.date.nil?
      @play.date <= Date.today ? @play.done = true : @play.done = false
    end
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
    @games = Game.all
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
    @participants = @play.participations.map(&:user_id)
    @users = User.all.reject { |u| @participants.include?(u.id) }

    @player = User.find_by(full_name: params[:player])

    if params[:player].nil?
      @response = "Pas de participant supplementaire"
    elsif @player
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
    params.require(:play).permit(:done, :won, :date, photos: [])
  end
end
