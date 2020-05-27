class PlaysChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "play_#{params[:play_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
