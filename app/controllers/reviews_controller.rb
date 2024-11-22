class ReviewsController < ApplicationController
  before_action :set_dream, only: [:new, :create]

  def new
    @review = Review.new
    @ratings = Review::RATINGS
    @user = current_user
  end

  def create
    @review = Review.new(review_params)
    @review.dream = @dream
    @review.user_id = current_user.id
    if @review.save!
      redirect_to dream_path(@dream)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_dream
    @dream = Dream.find(params[:dream_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating, :user)
  end
end
