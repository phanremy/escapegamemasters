class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @play = Play.find(params[:play_id])
    @message.play = @play
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.html { redirect_to play_path(@play) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "plays/show" }
        format.js
      end
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @play = @message.play
    if @message.destroy
      respond_to do |format|
        format.html { redirect_to play_path(@play) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "plays/show" }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
