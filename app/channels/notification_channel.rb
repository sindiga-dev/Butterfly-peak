class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def new_booking(data)
    ActionCable.server.broadcast "notifications_channel", { booking: data['booking'], caregiver_id: data['caregiver_id'] }
  end
end
