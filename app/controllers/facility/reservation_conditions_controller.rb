class Facility::ReservationConditionsController < ApplicationController
  before_action :authenticate_facility!

  def new
    @reservation_conditions = ReservationConditions.new
    @facility = current_facility
  end

  def create
    @reservation_conditions.facility_id = current_facility.id
    if @reservation.save
      flash[:notice] = "予約条件の登録が完了しました。"
      redirect_to facility_reservation_conditions_path
    else
      flash.now[:notice] = "予約条件の登録ができませんでした。"
      render new
    end
  end

private
  def reservation_conditions_params
    params.require(:reservation_conditions).permit(:unavailable_days, :unavailable_times, :maximum_number_of_people, :facility_id)
  end

end
