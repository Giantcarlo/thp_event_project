class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :current_user, only: [:index]
  

  def index
    @event = Event.find(params[:event_id])
  end
  def show
    @event = Event.find(params[:event_id])
  end

  def new
    @event = Event.find(params[:event_id])
  end 


  def create
    event = Event.find(params[:event_id])
    @attendance = Attendance.new(event: event, user: current_user, stripe_customer_id: params[:stripeEmail])

  #  unless event.is_free?
      @amount = event.price*100

      customer = Stripe::Customer.create({
                                           email: params[:stripeEmail],
                                           source: params[:stripeToken],
      })

      charge = Stripe::Charge.create({
                                       customer: customer.id,
                                       amount: @amount,
                                       description: 'Rails Stripe customer',
                                       currency: 'eur',
      })
  #  end
    if @attendance.save
        flash[:success] = "Tu t'es enregistré pour cet evenement!"
    else
        flash[:danger] = 'There was a problem during the registration process'
    end
    redirect_to event_path(event.id)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to event_path(event.id)

 end


end
