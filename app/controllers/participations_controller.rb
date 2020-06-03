class ParticipationsController < ApplicationController
  def destroy
    @participation = Participation.find(params[:id])
    play = @participation.play
    if current_user == play.user
      @participation.delete
      redirect_to play_path(play)
    else
      @participation.delete
      redirect_to user_path(current_user)
    end
  end
end
