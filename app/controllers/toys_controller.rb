class ToysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @toys = policy_scope(Toy)
  end

  def show
    @toy = Toy.find(params[:id])
  end

end
