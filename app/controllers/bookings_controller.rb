class BookingsController < ApplicationController
  # before_action :set_booking, only: [:show, :update, :destroy, :accept, :reject]
  # before_action :set_caregiver, only: [:index, :create]
  #   # before_action :set_parent
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @caregiver = Caregiver.find(@booking.caregiver_id)
      render json: @booking
    
    end
  end

  def index_by_parent
    parent = Parent.find(params[:parent_id])
    bookings = Booking.where(parent_id: parent.id)
    render json: bookings
  end
  
  
  def index
    bookings =Booking.all
    render json: bookings
  end

  def index_by_caregiver_and_parent
    parent = Parent.find_by(id: params[:parent_id])
    caregiver = Caregiver.find_by(id: params[:caregiver_id])
    if parent && caregiver
      bookings = parent.bookings.where(caregiver: caregiver)
      render json: bookings
    else
      render json: { error: "Couldn't find parent or caregiver" }, status: :not_found
    end
  end

 
def index_by_caregiver
  caregiver = Caregiver.find(params[:caregiver_id])
  bookings = Booking.where(caregiver_id: caregiver.id)
  render json: bookings
end

def toggle
  @booking = Booking.find(params[:id])
  if [true, false].include?(params[:status])
    if @booking.update(status: params[:status])
      render json: { message: "Booking status updated" }, status: :ok
    else
      render json: { errors: @booking.errors.full_messages }, status: :unprocessable_entity
    end
  else
    render json: { message: "Invalid status value" }, status: :unprocessable_entity
  end
end


  def show_caregiver_booking
    @bookings = Booking.where(caregiver_id: params[:caregiver_id])
    render json: @bookings
  end
  
  def show
    bookings = Booking.find(params[:id])
    render json: bookings
  end

 

  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: { errors: @booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    render json: @booking
  end

  def accept
    @booking.update(status: true)
    ActionCable.server.broadcast("bookings_#{params[:parent_id]}", { booking: @booking })
    render json: { message: "Booking Accepted" }, status: :ok
  end

  def reject
    @booking.update(status: false)
    ActionCable.server.broadcast "bookings_#{params[:parent_id]}", booking: @booking.as_json(only: [:id, :caregiver_id, :parent_id, :start_time, :end_time, :status])
    render json: { message: "Booking Rejected" }, status: :ok
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :caregiver_id, :parent_id, :status)
  end
  private

  def set_caregiver
    @caregiver = Caregiver.find(params[:caregiver_id])
  end

  
  def set_booking
  @booking = Booking.find(params[:id])
  end
  
  #permit booking params

  def booking_params
    params.permit(:start_time, :end_time, :caregiver_id, :parent_id, :status)
  end

  # def set_parent
  #   @parent = Parent.find(params[:parent_id])
  # end
  


 
end