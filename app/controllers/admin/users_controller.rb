module Admin
  class UsersController < ApplicationController

    def index
      @users = User.all.sort
    end

    def new

    end
    def create

    end

    def edit
    end

    def update
  
    end

    def destroy
      User.destroy(params[:id])
      # flash[:success] = "User successfully deleted"
      redirect_to admin_users_path
    end

  end

end