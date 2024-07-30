# frozen_string_literal: true

class IterableApi
  def initialize
  end

  def track_event(event_name, email, attrs)
    begin
      events = Iterable::Events.new
      # Any aditional attributes for the event
      # attrs = { campaignId: 42, dataFields: {} }
      response = events.track event_name, email, attrs
      puts response
      return true, response
    rescue => e
      puts e.message
      return false, e.message
    end
  end

  def notify_user(recipient_email, attrs)
    begin
      email = Iterable::Email.new
      # User email and campaign to target
      response = email.target recipient_email, 1, attrs
      return true, response
    rescue => e
      puts e.message
      return false, e.message
    end
  end
end
