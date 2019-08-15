
class EventavatarsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.eventavatar.attach(params[:eventavatar])
    if @event.eventavatar == nil
      redirect_to(event_path(@event))
    else 
      redirect_to root_path
    end
  
  end

  def new
    @event = Event.find(params[:event_id])
  end
end

