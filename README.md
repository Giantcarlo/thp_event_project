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


    <!--Code qui affiche "se deconnecter" si on est connecté, sinon il affiche un dropdown avec "s'inscrire/se connecter"-->
    <!--<%#if logged_in == true%>
      <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Mon Profil
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <%= link_to "Mon profil", user_show_path, class:"dropdown-item" %>
          <%= link_to "Se déconnecter", new_session_path, class:"dropdown-item" %>
        </div>
      </div>
    <%else%>
      <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Connexion
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <%= link_to "S'inscrire", registrations_new_path, class:"dropdown-item" %>
          <%= link_to "Se connecter", sessions_new_path, class:"dropdown-item" %>
        </div>
      </div>
    <%end%>-->
  <!--</div>-->