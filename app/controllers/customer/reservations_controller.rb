class Customer::ReservationsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_reservation, only: [:show, :edit, :update, :destroy]

  def new
    @reservation = Reservation.new(customer_id: current_customer.id)
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
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
