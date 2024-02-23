class Customer::ReservationsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_reservation, only: [:show, :edit, :update, :destroy]

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
    #予約日予約時間のバリデーション
    if @reservation.invalid?(:confirm)
      flash[:notice] = "予約日、予約時間の確認を行い正しい値を入力して下さい。"
      redirect_to(request.referer)
    end
    #複数のfamily_idをfamiliesに追加する処理
    if params[:reservation][:main_pick_up_person_family_id].present?
      @reservation.families << Family.find(params[:reservation][:main_pick_up_person_family_id])
    else
      flash[:notice] = "主な送迎者を選択して下さい。"
      redirect_to(request.referer)
    end
    if params[:reservation][:emergency_contact_1_family_id].present?
      @reservation.families << Family.find(params[:reservation][:emergency_contact_1_family_id])
    else
      flash[:notice] = "緊急連絡先を選択して下さい。"
      redirect_to(request.referer)
    end
    if params[:reservation][:emergency_contact_2_family_id].present?
      @reservation.families << Family.find(params[:reservation][:emergency_contact_2_family_id])
    end
  end

  def thanks
  end

  def create
    @reservation = Reservation.new(reservation_params)
    start_time = DateTime.new(day(1i), day(2i), day(3i), start_time(4i), start_time(5i))
    end_time = DateTime.new(day(1i), day(2i), day(3i), emd_time(6i), emd_time(7i))
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
    params.require(:reservation).permit(:day, :start_time, :end_time, :wants_meal_service, :purpose_of_use, :customer_id, :facility_id, :child_id, :menu_id)
  end

  def ensure_reservation
    @reservation = Reservation.find(params[:id])
  end

end
