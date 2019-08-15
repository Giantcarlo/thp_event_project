class EventavatarsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.eventavatar.attach(params[:eventavatar])
    redirect_to(event_path(@event))
  end

  def new
    @event = Event.find(params[:event_id])
  end
end
