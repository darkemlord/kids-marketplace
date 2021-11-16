class ToysController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @toys = policy_scope(Toy)
  end

  def show
    #@toy = Toy.find(params[:id])
    set_toy
  end

  private
  def set_toy
    @toy = Toy.find(params[:id])
    authorize @toy
  end

end
