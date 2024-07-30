require 'iterable'
require 'iterable_api'

class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_iterable_api_obj

  def index
  end

  def send_event
    event_name = params[:event_name]
    # Any aditional attributes for the event
    # attrs = { campaignId: 42, dataFields: {} }
    success, response = @iterable_api_obj.track_event(event_name, current_user.email, {})
    if success
      flash[:notice] = "Event '#{event_name}' sent successfully!"
    else
      flash[:alert] = "Failed to send event '#{event_name}': #{response}"
    end

    redirect_to action: :index
  end

  def send_email
    event_name = params[:event_name]
    # Any aditional attributes for the event
    # attrs = { campaignId: 42, dataFields: {} }
    success, response = @iterable_api_obj.notify_user(current_user.email, {})
    if success
      flash[:notice] = "Event '#{event_name}' sent successfully!"
    else
      flash[:alert] = "Failed to send event '#{event_name}': #{response}"
    end

    redirect_to action: :index
  end

  private

  def set_iterable_api_obj
    @iterable_api_obj = IterableApi.new
  end
end
