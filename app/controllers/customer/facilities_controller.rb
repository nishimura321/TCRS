class Customer::FacilitiesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @facilities = Facility.page(params[:page])
  end

  def show
    @facility = Facility.find(params[:id])
    @reservations = Reservation.where(facility_id: @facility.id, is_valid_reservation: true).order(day: :desc)
  end

  private
  def facility_params
    params.require(:facility).permit(:name, :name_kana, :email, :password, :postal_code, :address, :telephone_number, :website, :business_day, :business_hours, :inquiry_hours, :closed_day, :childcare_hours, :target_age, :school_meal, :fee, :message)
  end
end
