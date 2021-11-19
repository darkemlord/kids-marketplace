class ToysController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index




    if params[:query].present?
      @toys = policy_scope(Toy)
      @available_toys = availability_window_checker
      #@available_toys = Toy.where("name ILIKE ?", "%#{params[:query]}%")
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @available_toys = Toy.where(sql_query, query: "%#{params[:query]}%")

    else
      @toys = policy_scope(Toy)
      @available_toys = availability_window_checker
    end


  end

  def show
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

  def availability_window_checker
    # date format: 2021-11-18
    today = DateTime.now.to_date
    seven_days_from_now = (today + 7).to_date

    @available_toys = []
    @unavailable_toys = @toys.unavailable(today, seven_days_from_now)

    @toys.each do |toy|
      @unavailable_toys.each do |unavailable_toy|
        if toy == unavailable_toy
          @toy_to_not_show = toy
        end
      end
      @available_toys << toy if toy != @toy_to_not_show
    end
    @available_toys
  end


  def set_toy
    @toy = Toy.find(params[:id])
    authorize @toy
  end

  def toy_params
    params.require(:toy).permit(:name, :description, :condition, :category, :price, :photo)
  end
end
