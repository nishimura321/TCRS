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
    @reservation.main_pick_up_person = Family.find(params[:reservation][:main_pick_up_person])
    @reservation.emergency_contact_1 = Family.find(params[:reservation][:emergency_contact_1])
    if params[:reservation][:emergency_contact_2].present?
      @reservation.emergency_contact_2 = Family.find(params[:reservation][:emergency_contact_2])
    end
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
  end

  def thanks
  end

  def create
    @reservation = Reservation.new(reservation_params)
    #予約時間の日付をセットする処理
    new_start_time = @reservation.start_time.change(year: @reservation.day.year, month: @reservation.day.month, day: @reservation.day.day)
    @reservations.start_time = new_start_time
    new_end_time = @reservation.end_time.change(year: @reservation.day.year, month: @reservation.day.month, day: @reservation.day.day)
    @reservations.end_time = new_end_time
    #予約日と献立日が一致する献立IDをセットする処理
    @menu = Menu.find_by(date: Date.parse(params[:reservation][:day]))
    if @menu
      @menu_id = @menu.id
    else
      @menu_id = nil
    end
    @reservation.menu_id = @menu_id
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
    params.require(:reservation).permit(:day, :start_time, :end_time, :wants_meal_service, :purpose_of_use, :main_pick_up_person, :emergency_contact_1, :emergency_contact_2, :customer_id, :facility_id, :child_id, :family_id)
  end

  def ensure_reservation
    @reservation = Reservation.find(params[:id])
  end

end
