class Facility::ReservationsController < ApplicationController
  before_action :authenticate_facility!
  before_action :ensure_reservation, only: [:show, :edit, :update]

  def index
    @reservations = current_facility.reservations.page(params[:page])
  end

  def show
    @main_pick_up_person = Family.find(@reservation.main_pick_up_person)
    @emergency_contact_1 = Family.find(@reservation.emergency_contact_1)
    if @reservation.emergency_contact_2.present?
      @emergency_contact_2 = Family.find(@reservation.emergency_contact_2)
    end
  end

  def edit
    @children = Child.where(customer_id: @reservation.customer_id)
    @families = Family.where(customer_id: @reservation.customer_id)
    @main_pick_up_person = Family.find(@reservation.main_pick_up_person)
    @emergency_contact_1 = Family.find(@reservation.emergency_contact_1)
    if @reservation.emergency_contact_2.present?
      @emergency_contact_2 = Family.find(@reservation.emergency_contact_2)
    end
  end

  def update
    if @reservation.update(reservation_params)
      if params[:reservation][:wants_meal_service] == "false"
        @reservation.update(is_allergy_checked: false)
      elsif params[:reservation][:wants_meal_service] == "true"
        @reservation.update(is_allergy_checked: true)
      end
      flash[:notice] = "修正が完了しました。"
      redirect_to reservation_path(@reservation)
    else
      flash.now[:notice] = "修正の保存に失敗しました。"
      render :edit
    end
  end

  def destroy
  end

  def situation
  end

  private
  def reservation_params
    params.require(:reservation).permit(:day, :start_time, :end_time, :wants_meal_service, :purpose_of_use, :main_pick_up_person, :emergency_contact_1, :emergency_contact_2, :customer_id, :facility_id, :child_id, :family_id, :menu_id)
  end

  def ensure_reservation
    @reservation = current_facility.reservations.find(params[:id])
  end

end
