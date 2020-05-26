class ParticipationsController < ApplicationController
  def destroy
    @participation = Participation.find(params[:id])
    play = @participation.play
    @participation.delete
    redirect_to play_path(play)
  end
end
