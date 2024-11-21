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
    @bookings = @user.bookings
    @dreams = @user.dreams
  end

  def bookingsdashboard
    @user = current_user
    @bookings = @user.bookings
  end
end
