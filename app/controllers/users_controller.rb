class UsersController < ApplicationController
  autocomplete :users, :full_name, full: true

  def index
    @users = User.all.order(:id)
  end

  def show
    @user = User.find(params[:id])
    @plays = Play.all.select { |play| @user.participations.map(&:play_id).include?(play.id) }

    # GAMES WHERE USER IS ADMIN BUT NOT PARTICIPANT, NOT COUNTED IN STATS
    @admin_only = @user.plays.reject { |play| @plays.map(&:id).include?(play.id) }

    @win = @plays.select(&:won)
    @lose = @plays.select { |play| play.won == false }
    @one = @win.count + @lose.count
    @none = @plays.count - @one
    @pending = @plays.select { |play| true unless play.done }
    @user.top ? @top = @user.top : @top = Top.new
  end
end
