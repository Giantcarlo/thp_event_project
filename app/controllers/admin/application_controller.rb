module Admin

  class ApplicationController < ::ApplicationController


    before_action :only_admin

    private

    def only_admin
      if user_signed_in? == false || current_user.admin == false
        redirect_to root_path
      end
    end

  end

end