class RoomsController < ApplicationController
  def index
    if q = params[:q]
       @rooms = Room.search_room(q)
    else
      @rooms = Room.all
    end

  end
  def show
    @room = Room.find(params[:id])
    @booking = Booking.new
  end
end
