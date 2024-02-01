class Facility::FacilitiesController < ApplicationController
  before_action :authenticate_facility!
  before_action :ensure_facility, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @facility.update(facility_params)
      flash[:notice] = "修正が完了しました。"
      redirect_to facility_facility_path(@facility)
    else
      flash.now[:notice] = "修正の保存に失敗しました。"
      render :edit
    end
  end

  private
  def facility_params
    params.require(:facility).permit(:name, :name_kana, :email, :password, :postal_code, :address, :telephone_number, :website, :business_day, :business_hours, :inquiry_hours, :closed_day, :childcare_hours, :target_age, :school_meal, :fee, :message, :is_active)
  end

  def ensure_facility
    @facility = Facility.find(params[:id])
  end

end
