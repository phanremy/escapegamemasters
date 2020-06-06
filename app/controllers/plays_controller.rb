class PlaysController < ApplicationController
  autocomplete :game, :name, full: true


  def index
    @plays = Play.all
  end

  def show
    @play = Play.includes(messages: :user).find(params[:id])

    # check the users which are not already included in the play
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
    # DOES NOT WORK IF DATE BEFORE IS REMOVED
    @play = Play.find(params[:id])
    raise
    if @play.update(play_params)
      unless @play.date.nil?
        @play.date <= Date.today ? @play.update(done: true) : @play.update(done: false)
      end
      redirect_to play_path(@play)
    else
      render :edit
    end
  end

  def destroy
    @play = Play.find(params[:id])
    @user = @play.user
    @play.destroy
    redirect_to user_path(@user)
  end

  def add_players
    @play = Play.find(params[:play_id])
    @participants = @play.participations.map(&:user_id)
    @users = User.all.reject { |u| @participants.include?(u.id) }

    @player = User.search_by_fullname(params[:player])

    if params[:player].nil?
      @response = "Pas de participant supplementaire"
    elsif @player.count == 1
      Participation.create(play: @play, user: @player[0])
      @response = "Player found"
    elsif params[:player] != ""
      Participation.create(play: @play, optional_name: params[:player])
      @response = "Player not found, added dummy player"
    else
      @response = "Player not found"
    end
      redirect_to play_path(@play)
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
