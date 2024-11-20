class ReviewsController < ApplicationController
  before_action :set_booking, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = @booking.reviews.build(review_params)
    # @booking = Booking.find(params[:booking_id])
    # @review.booking = @booking
    if @review.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
