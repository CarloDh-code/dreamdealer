class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @total_dashboard = calculate_total_price
    @bookings = @user.bookings
    @dreams = Dream.where(user: current_user)
    @bookings_received = Booking.where(dream_id: @dreams.pluck(:id))
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


private

  def calculate_total_price
    @user = current_user
    total = @user.dreams.sum do |dream|
      dream.bookings.where(status: true).sum(&:total_price)
    end
    total.round(0)
  end
end
