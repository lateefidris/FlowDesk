class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
    @bookings = Booking.all
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)
  
    respond_to do |format|
      if @booking.save
        if current_user # Check if the user is logged in
          format.html { redirect_to booking_path(@booking), notice: "Booking was successfully created." }
        else
          format.html { redirect_to client_booking_path(@booking), notice: "Booking was successfully created." }
        end
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def confirm
    booking = Booking.find(params[:id])
    if booking.update(status: :confirmed)
      redirect_to booking, notice: 'Booking was successfully confirmed.'
    else
      redirect_to booking, alert: 'There was an issue confirming the booking.'
    end
  end

  def complete
    @booking = Booking.find(params[:id])
    if @booking.update(status: :completed)
      redirect_to @booking, notice: 'Booking was successfully marked as completed.'
    else
      redirect_to @booking, alert: 'There was an issue completing the booking.'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:desk_id, :service_id, :client_name, :client_email, :appointment)
    end
end
