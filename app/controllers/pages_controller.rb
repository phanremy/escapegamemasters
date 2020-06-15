class PagesController < ApplicationController
  def home
    @user = User.find(1)
    @plays = Play.all.select { |play| @user.participations.map(&:play_id).include?(play.id) }

    # GAMES WHERE USER IS ADMIN BUT NOT PARTICIPANT, NOT COUNTED IN STATS
    @admin_only = @user.plays.reject { |play| @plays.map(&:id).include?(play.id) }

    @win = @plays.select(&:won)
    @lose = @plays.select { |play| play.won == false }
    @one = @win.count + @lose.count
    @none = @plays.count - @one
    @pending = @plays.select { |play| true unless play.done }
    @top = @user.top

    @play = Play.includes(messages: :user).find(1)

    # check the users which are not already included in the play
    @participants = @play.participations.map(&:user_id)
    @users = User.all.reject { |u| @participants.include?(u.id) }
  end
end
