class Admin::FacilitiesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      flash[:notice] = "新規登録が完了しました。"
      redirect_to admin_facility_path(@facility)
    else
      flash.now[:notice] = "新規登録に失敗しました。"
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def situation
  end

  private
  def facility_params
    params.require(:facility).permit(:name, :name_kana, :email, :password, :postal_code, :address, :telephone_number, :website, :business_day, :business_hours, :inquiry_hours, :closed_day, :childcare_hours, :target_age, :school_meal, :fee, :message)
  end

end
