
ruby '2.5.1'

gem 'rails', '~> 5.2.3'


Si tu veux un évènement déjà fait que tu peux utiliser dans la console:
 e = Event.create(title:"Soccer", start_date:DateTime.new(2020,2,3), duration:50, description:"A soccer tournament for young budding players", price:50, location:"Seattle", organizer:User.find(4))

