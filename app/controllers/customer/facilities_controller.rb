class Customer::FacilitiesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @facilities = Facility.page(params[:page])
  end

  def show
    @facility = Facility.find(params[:id])
    start_date = Date.current
    end_date = start_date.end_of_month.next_month
    @reservations = @facility.reservations.all.where("day >= ? AND day <= ?", start_date, end_date).order(day: :desc)
  end

  private
  def facility_params
    params.require(:facility).permit(:name, :name_kana, :email, :password, :postal_code, :address, :telephone_number, :website, :business_day, :business_hours, :inquiry_hours, :closed_day, :childcare_hours, :target_age, :school_meal, :fee, :message)
  end
end
