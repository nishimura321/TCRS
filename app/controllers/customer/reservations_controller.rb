class Customer::ReservationsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_reservation, only: [:show, :edit, :update, :destroy]

  def new
    start_date = Date.current
    end_date = start_date.end_of_month.next_month
    @reservations = Reservation.all.where("day >= ? AND day <= ?", start_date, end_date).order(day: :desc)
    @reservation = Reservation.new(customer_id: current_customer.id)
    
  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end

  def confirm_allergy
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date, :time, :wants_meal_service, :purpose_of_use)
  end

  def ensure_reservation
    @reservation = Reservation.find(params[:id])
  end
  
end
