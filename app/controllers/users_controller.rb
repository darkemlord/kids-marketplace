class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    #@toy = Toy.find(params[:id])
    set_user

  end

  private
  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
