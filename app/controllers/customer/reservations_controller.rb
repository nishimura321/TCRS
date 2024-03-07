class Customer::ReservationsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_reservation, only: [:show, :edit, :update, :cancel]

  def new
    @facility = Facility.find(params[:facility_id])
    @reservations = @facility.reservations.validation_checked.order(day: :desc)
    @reservation = Reservation.new
    @active_children = current_customer.children.where(is_active: true)
    @active_families = current_customer.families.where(is_active: true)
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    #予約時間の日付をセットする処理
    if @reservation.day.present?
      new_start_time = @reservation.start_time.change(year: @reservation.day.year, month: @reservation.day.month, day: @reservation.day.day)
      @reservation.start_time = new_start_time
      new_end_time = @reservation.end_time.change(year: @reservation.day.year, month: @reservation.day.month, day: @reservation.day.day)
      @reservation.end_time = new_end_time
    end
    #バリデーションの実行処理
    if @reservation.invalid?
      @facility = Facility.find(@reservation.facility_id)
      @reservations = @facility.reservations.validation_checked.order(day: :desc)
      @active_children = current_customer.children.where(is_active: true)
      @active_families = current_customer.families.where(is_active: true)
      flash[:notice] = "入力内容の確認を行い正しい値を入力して下さい。"
      render :new
      return
    end
    @main_pick_up_person = Family.find(@reservation.main_pick_up_person)
    @emergency_contact_1 = Family.find(@reservation.emergency_contact_1)
    if params[:reservation][:emergency_contact_2].present?
      @emergency_contact_2 = Family.find(@reservation.emergency_contact_2)
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    #予約日と献立日が一致する献立IDをセットする処理
    @menu = Menu.find_by(date: Date.parse(params[:reservation][:day]))
    if @menu
      @menu_id = @menu.id
    else
      @menu_id = nil
    end
    @reservation.menu_id = @menu_id
    #給食がなしの場合アレルギーステータスをfalseにする処理
    if @reservation.wants_meal_service == false
      @reservation.is_allergy_checked = false
    end
    if @reservation.save
      flash[:notice] = "ご予約が完了しました。"
      redirect_to reservations_thanks_path(id: @reservation.id)
    else
      @facility = Facility.find(@reservation.facility_id)
      @reservations = @facility.reservations.validation_checked.order(day: :desc)
      @active_children = current_customer.children.where(is_active: true)
      @active_families = current_customer.families.where(is_active: true)
      flash.now[:notice] = "大変申し訳ございません。新規予約ができませんでした。再度予約画面から操作をお願いいたします。"
      render :new
    end
  end

  def thanks
    @reservation = current_customer.reservations.find(params[:id])
  end

  def index
    @reservations = current_customer.reservations.page(params[:page])
  end

  def show
    @main_pick_up_person = Family.find(@reservation.main_pick_up_person)
    @emergency_contact_1 = Family.find(@reservation.emergency_contact_1)
    if @reservation.emergency_contact_2.present?
      @emergency_contact_2 = Family.find(@reservation.emergency_contact_2)
    end
  end

  def confirm_allergy_view
    @reservation = Reservation.find(params[:id])
    @menu = Menu.find(@reservation.menu_id)
  end

  def confirm_allergy
    @reservation = Reservation.find(params[:id])
    @reservation.update(is_allergy_checked: false)
    flash[:notice] = "献立のアレルギー確認が完了しました。"
    redirect_to reservation_path(@reservation)
  end

  def edit
    @active_children = current_customer.children.where(is_active: true)
    @active_families = current_customer.families.where(is_active: true)
    @main_pick_up_person = Family.find(@reservation.main_pick_up_person)
    @emergency_contact_1 = Family.find(@reservation.emergency_contact_1)
    if @reservation.emergency_contact_2.present?
      @emergency_contact_2 = Family.find(@reservation.emergency_contact_2)
    end
  end

  def update
    if @reservation.update(reservation_params)
      if params[:reservation][:wants_meal_service] == "true"
        @reservation.update(is_allergy_checked: true)
      else
        @reservation.update(is_allergy_checked: false)
      end
      flash[:notice] = "修正が完了しました。"
      redirect_to reservation_path(@reservation)
    else
      @active_children = current_customer.children.where(is_active: true)
      @active_families = current_customer.families.where(is_active: true)
      @main_pick_up_person = Family.find(@reservation.main_pick_up_person)
      @emergency_contact_1 = Family.find(@reservation.emergency_contact_1)
      if @reservation.emergency_contact_2.present?
        @emergency_contact_2 = Family.find(@reservation.emergency_contact_2)
      end
      flash.now[:notice] = "修正の保存に失敗しました。"
      render :edit
    end
  end

  def cancel
    @reservation.update(is_valid_reservation: false)
    if @reservation.wants_meal_service
      @reservation.update(is_allergy_checked: false)
    end
    flash[:notice] = "キャンセルが完了しました。"
    redirect_to reservations_path
  end

  private
  def reservation_params
    params.require(:reservation).permit(:day, :start_time, :end_time, :wants_meal_service, :purpose_of_use, :main_pick_up_person, :emergency_contact_1, :emergency_contact_2, :customer_id, :facility_id, :child_id, :family_id, :menu_id)
  end

  def ensure_reservation
    @reservation = current_customer.reservations.find(params[:id])
  end

end
