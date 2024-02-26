class Customer::ReservationsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_reservation, only: [:show, :edit, :update, :destroy]

  def new
    start_date = Date.current
    end_date = start_date.next_month.end_of_month
    @facility = Facility.find(params[:facility_id])
    @reservations = Reservation.where("day >= ? AND day <= ? AND facility_id = ?", start_date, end_date, @facility).order(day: :desc)
    @reservation = Reservation.new
    @children = current_customer.children
    @families = current_customer.families
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    #バリデーションの実行処理
    if @reservation.invalid?
      start_date = Date.current
      end_date = start_date.next_month.end_of_month
      @facility = Facility.find(@reservation.facility_id)
      @reservations = Reservation.where("day >= ? AND day <= ? AND facility_id = ?", start_date, end_date, @facility).order(day: :desc)
      @children = current_customer.children
      @families = current_customer.families
      flash[:notice] = "入力内容の確認を行い正しい値を入力して下さい。"
      render :new
      return
    end
    #複数のfamily_idをfamiliesに追加する処理
    if params[:reservation][:main_pick_up_person_family_id].present? && params[:reservation][:emergency_contact_1_family_id].present?
      @reservation.families << Family.find(params[:reservation][:main_pick_up_person_family_id])
      @reservation.families << Family.find(params[:reservation][:emergency_contact_1_family_id])
    else
      flash[:notice] = "主な送迎者と緊急連絡先１は必ず選択して下さい。"
      render :new
      return
    end
    if params[:reservation][:emergency_contact_2_family_id].present?
      @reservation.families << Family.find(params[:reservation][:emergency_contact_2_family_id])
    end
  end

  def thanks
  end

  def create
    @reservation = Reservation.new(reservation_params)
    #予約時間の日付をセットする処理
    start_date = Date.parse(params[:reservation][:day])
    start_time = Time.zone.parse(params[:reservation][:start_time])
    end_date = Date.parse(params[:reservation][:day])
    end_time = Time.zone.parse(params[:reservation][:end_time])
    #予約日と献立日が一致する献立IDをセットする処理
    @menu = Menu.find_by(date: Date.parse(params[:reservation][:day]))
    if @menu
      @menu_id = @menu.id
    else
      @menu_id = nil
    end
    @reservation.families << Family.find(params[:reservation][:main_pick_up_person_family_id])
    @reservation.families << Family.find(params[:reservation][:emergency_contact_1_family_id])
    @reservation.families << Family.find(params[:reservation][:emergency_contact_2_family_id])
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
