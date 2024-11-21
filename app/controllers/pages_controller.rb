class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @bookings = @user.bookings
    @dreams = @user.dreams
  end

  def dreamsdashboard
    @user = current_user
    @dreams = Dream.where(user: current_user)
    @bookings = Booking.where(dream_id: @dreams.pluck(:id))
  end

  def bookingsdashboard
    @user = current_user
    @bookings = @user.bookings
  end
end
