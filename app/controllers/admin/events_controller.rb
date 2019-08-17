module Admin

  class EventsController < ApplicationController

    def index
      @events = Event.all
    end

    def destroy
      Event.destroy(params[:id])
      redirect_to admin_events_path
    end

  end


end