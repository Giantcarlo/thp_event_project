# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Random event for the console: e = Event.create(title:"Soccer", start_date:DateTime.new(2020,2,3), duration:50, description:"A soccer tournament for young budding players", price:50, location:"Seattle", organizer:User.find(4))

class UserMailer < ApplicationMailer
  default from: 'no-reply@events.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://events.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end


  def organizer_notification(event)
    @organizer = event.organizer

    @url  = 'http://events.fr/login' 
    
    mail(to: @organizer.email, subject: "Nouvelle inscription")
  end 
end
