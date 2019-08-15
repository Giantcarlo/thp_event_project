class EventsController < ApplicationController
  before_action :has_photo, only: [:index]

  def index
    @events = Event.all
  end

  def show
    puts '&' * 60
    puts params 
    @event = Event.find(params[:id])
    @organizer = @event.organizer
  end

  def new
  end

  def create
    @title = params[:title]
    @description = params[:description]
    @start_date = params[:start_date]    
    @duration = params[:duration]
    @location = params[:location]
    @price = params[:price]

    @event = Event.create(title:@title, organizer:current_user, description:@description, start_date:@start_date, duration:@duration, location:@location, price:@price) 

    if @event.save 
      # si ça marche, il redirige vers la page d'index du site
      # flash[:success] = 'Evenement sauvegardé'
      redirect_to new_event_eventavatar_path(@event.id)

    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render 'new'
    end

  end

  def update
  end

  def destroy
  end

  private

  def has_photo
    @events = Event.all
    @events.each do |e|
      if e.eventavatar.attached? == nil
        Event.destroy(e.id)
      end
    end
  end
end
