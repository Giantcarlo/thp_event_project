class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  # L'utilisateur doit etre connecté pour pouvoir faire une de ces actions ci-dessus
  before_action :authenticate_current_user, only: [:show]
  # Le current_user doit etre le createur du potin pour pouvoir editer ou detruire un potin

  def show
    @user = User.find(params[:id])  
  end

  def edit
    @user = User.find(params[:id]) 
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :description)   
  end 

  # def authenticate_user
  #   unless current_user
  #     flash[:danger] = "Tu dois te connecter ou t'inscrire."
  #     redirect_to new_user_registration_path
  #   end
  # end

  def authenticate_current_user
    unless current_user.admin == true
      unless current_user == User.find(params[:id]) 
      flash[:danger] = "Impossible d'aller sur cette page."
      redirect_to root_path
      end
    end
  end


end
