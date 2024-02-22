class BookingsController < ApplicationController


  def create
    @booking = Booking.new(booking_params)
    @booking.room_id = params[:room_id]
    @booking.user_id = current_user.id

    if @booking.save
      # Réussite de la création de la réservation
      redirect_to rooms_path, notice: 'La réservation a été créée avec succès.'
    else
      # Échec de la création de la réservation
      redirect_to rooms_path, notice: 'La réservation n\'a pas été créée.'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_date, :room_id, :user_id)
  end

end
