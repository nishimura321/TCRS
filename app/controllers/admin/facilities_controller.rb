class Admin::FacilitiesController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_facility, only: [:show, :edit, :update, :withdrawal]

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      flash[:notice] = "施設登録が完了しました。"
      redirect_to admin_facility_path(@facility)
    else
      flash.now[:notice] = "施設登録ができませんでした。"
      render :new
    end
  end

  def index
    @facilities = Facility.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    if @facility.update(facility_params)
      flash[:notice] = "修正が完了しました。"
      redirect_to admin_facility_path(@facility)
    else
      flash.now[:notice] = "修正の保存に失敗しました。"
      render :edit
    end
  end

  def withdrawal
    facility.update(is_active: false)
    flash[:notice] = "閉園処理を行いました。"
    redirect_to admin_facilities_path
  end

  def situation
  end

  private
  def facility_params
    params.require(:facility).permit(:name, :name_kana, :email, :password, :postal_code, :address, :telephone_number, :website, :business_day, :business_hours, :inquiry_hours, :closed_day, :childcare_hours, :target_age, :school_meal, :fee, :message)
  end

  def ensure_facility
    @facility = Facility.find(params[:id])
  end

end
