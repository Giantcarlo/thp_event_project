class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
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
      flash[:success] = 'Evenement sauvegardé'
      redirect_to root_path

    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render 'new'
    end

  end

  def update
  end

  def destroy
  end
end
