class ToysController < ApplicationController

  def show
    @toy = Toy.find(params[:id])
    authorize @toy
  end
end
