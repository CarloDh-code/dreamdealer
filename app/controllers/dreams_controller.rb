class DreamsController < ApplicationController
before_action :set_dream, only: [:show]

  def index
    @dreams = Dream.all
  end

  def show
    @dream = Dream.find(params[:id])
    @booking = Booking.new
    @reviews = @dream.reviews
  end

  def new
    @dream = Dream.new
    @categories = Dream::CATEGORIES
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user = current_user
    if @dream.save
      redirect_to dream_path(@dream)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def set_dream
    @dream = Dream.find(params[:id])
  end

  def dream_params
    params.require(:dream).permit(:title, :description, :price_per_night, :category, :age_limit, :number_of_roles, photos: [])
  end

end
