class ToysController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @toys = policy_scope(Toy)
  end

  def show
    #@toy = Toy.find(params[:id])
    set_toy
    @user_id = @toy.user.id
    @users = User.where(id: @user_id)
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }

    end
  end

  def new
    @toy = Toy.new
    authorize @toy
  end

  def create
    @toy = Toy.new(toy_params)
    @toy.user = current_user
    authorize @toy
    if @toy.save
      redirect_to toy_path(@toy)
    else
      render :new
    end
  end

  private

  def set_toy
    @toy = Toy.find(params[:id])
    authorize @toy
  end

  def toy_params
    params.require(:toy).permit(:name, :description, :condition, :category, :price, :photo)
  end
end
