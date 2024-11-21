class BookingsController < ApplicationController
  before_action :set_booking, only:[:show, :accept, :decline]
  before_action :set_dream, only:[:create]

  def show
  end

  def new
    @dream = Dream.find(params[:dream_id]) # Charge le Dream
    @booking = @dream.bookings.new        # Prépare une nouvelle Booking associée
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.dream = @dream
    @booking.user = current_user
    if @booking.save
      redirect_to bookingsdashboard_path
    else
      flash.now[:alert] = "Erreur lors de la création de la réservation."

    end
  end


  def accept
    @booking.status = true
    @booking.save!
    redirect_to dreamsdashboard_path
  end

  def decline
    @booking.status = false
    @booking.save!
    redirect_to dreamsdashboard_path
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :dream_id, :user_id)
  end

  def set_dream
    @dream = Dream.find(params[:dream_id])
  end
end
