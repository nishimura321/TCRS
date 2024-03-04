class Admin::ReservationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_reservation, only: [:show, :edit, :update]

  def index
    @reservations = Reservation.order(id: :desc).page(params[:page])
  end

  def show
    @main_pick_up_person = Family.find(@reservation.main_pick_up_person)
    @emergency_contact_1 = Family.find(@reservation.emergency_contact_1)
    if @reservation.emergency_contact_2.present?
      @emergency_contact_2 = Family.find(@reservation.emergency_contact_2)
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:day, :start_time, :end_time, :wants_meal_service, :purpose_of_use, :main_pick_up_person, :emergency_contact_1, :emergency_contact_2, :customer_id, :facility_id, :child_id, :family_id, :menu_id)
  end

  def ensure_reservation
    @reservation = Reservation.find(params[:id])
  end
end
