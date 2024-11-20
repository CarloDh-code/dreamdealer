class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @bookings = @user.bookings # Fetches all bookings for the user
    @dreams = @user.dreams
  end

  def dreamsdashboard
    @user = current_user
    @bookings = @user.bookings # Fetches all bookings for the user
    @dreams = @user.dreams
  end

  def bookingsdashboard
    @user = current_user
    @bookings = @user.bookings # Fetches all bookings for the user
    @dreams = @user.dreams
  end
end
