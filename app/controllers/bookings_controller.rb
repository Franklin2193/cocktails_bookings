class BookingsController < ApplicationController
  require 'simple-form-datepicker'
  before_action :set_booking, only: %i[show destroy]
  before_action :set_cocktail, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.cocktail = @cocktail
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @booking.destroy
    redirect_to 'cocktails/index'
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
