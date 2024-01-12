class SearchChannel < ApplicationCable::Channel
  def subscribed
    stream_from "search_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
