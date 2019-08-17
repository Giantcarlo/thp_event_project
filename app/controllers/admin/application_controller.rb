module Admin

  class ApplicationController < ::ApplicationController


    before_action :only_admin

    private

    def only_admin
      if user_signed_in? && current_user.admin == false
        flash[:errors] = "Vous n'avez pas le droit d'accéeder à cette page!"    
        redirect_to root_path
      elsif user_signed_in? == false
        flash[:errors] = "Vous n'avez pas le droit d'accéeder à cette page!"    
        redirect_to root_path
      end
    end

    
  end

end