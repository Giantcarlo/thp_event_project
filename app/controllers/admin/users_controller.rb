module Admin


  class UsersController < ApplicationController

    def index
      @users = User.all
    end

    def new

    end

    def edit
    end

    def update
  
    end

    def delete

      # @comment = Comment.find(params[:id])
      # @comment.destroy
      # redirect_to gossip_path(@comment.gossip.id)

    end

  end

end