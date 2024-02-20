class Customer::ReservationsController < ApplicationController
  before_action :authenticate_customer!
  #before_action :ensure_reservation, only: [:show, :edit, :update, :destroy]

  def new
    start_date = Date.current
    end_date = start_date.end_of_month.next_month
    @facility = Facility.find(params[:facility_id])
    @reservations = Reservation.where("day >= ? AND day <= ? AND facility_id = ?", start_date, end_date, @facility).order(day: :desc)
    @reservation = Reservation.new
    @children = current_customer.children
    @families = current_customer.families
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @facility = Facility.find(params[:reservation][:facility_id])
    @reservation.child = Child.find(params[:reservation][:child_id])
    @reservation.families << Family.find(params[:reservation][:main_pick_up_person_family_id])
    @reservation.families << Family.find(params[:reservation][:emergency_contact_1_family_id])
    @reservation.families << Family.find(params[:reservation][:emergency_contact_2_family_id])
    @reservation.customer = current_customer
  end

  def thanks
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "ご予約が完了しました。"
      redirect_to reservations_thanks_path
    else
      flash.now[:notice] = "新規予約ができませんでした。"
      render reservations_confirm_path
    end
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
    params.require(:reservation).permit(:day, :start_time, :end_time, :wants_meal_service, :purpose_of_use)
  end

  #def ensure_reservation
   # @reservation = Reservation.find(params[:id])
  #end

end
