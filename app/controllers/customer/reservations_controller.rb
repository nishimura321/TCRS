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
    #カスタムバリデーションの実行処理
    if @reservation.invalid?
      flash[:notice] = "入力内容の確認を行い正しい値を入力して下さい。"
      redirect_to(request.referer)
      return
    end
    #複数のfamily_idをfamiliesに追加する処理
    if params[:reservation][:main_pick_up_person_family_id].present? && params[:reservation][:emergency_contact_1_family_id].present?
      @reservation.families << Family.find(params[:reservation][:main_pick_up_person_family_id])
      @reservation.families << Family.find(params[:reservation][:emergency_contact_1_family_id])
    else
      flash[:notice] = "主な送迎者と緊急連絡先の確認を行い正しく選択して下さい。"
      redirect_to(request.referer)
      return
    end
    if params[:reservation][:emergency_contact_2_family_id].present?
      @reservation.families << Family.find(params[:reservation][:emergency_contact_2_family_id])
    end
    #予約日と献立日が一致する献立IDを指定する処理
    @menu = Menu.find_by(date: Date.parse(params[:reservation][:day]))
    if @menu
      @menu_id = @menu.id
    else
      @menu_id = nil
    end
  end

  def thanks
  end

  def create
    @reservation = Reservation.new(reservation_params)
    start_time = DateTime.new(params[:reservation]["day(1i)"].to_i, params[:reservation]["day(2i)"].to_i, params[:reservation]["day(3i)"].to_i, params[:reservation]["start_time(4i)"].to_i, params[:reservation]["start_time(5i)"].to_i)
    end_time = DateTime.new(params[:reservation]["day(1i)"].to_i, params[:reservation]["day(2i)"].to_i, params[:reservation]["day(3i)"].to_i, params[:reservation]["end_time(4i)"].to_i, params[:reservation]["end_time(5i)"].to_i)
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
