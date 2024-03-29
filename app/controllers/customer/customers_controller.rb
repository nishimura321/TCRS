class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_customer, only: [:show, :edit, :update, :withdrawal]
  before_action :ensure_guest_user, only: [:edit]

  def show
    @active_children = @customer.children.where(is_active: true)
    @active_families = @customer.families.where(is_active: true)
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      flash[:notice] = "修正が完了しました。"
      redirect_to customers_mypage_path(current_customer)
    else
      flash.now[:notice] = "修正に失敗しました。"
      render :edit
    end
  end

  def confirm_withdrawal
  end

  def withdrawal
    reservations = @customer.reservations.where(is_valid_reservation: true)
    reservations.each do |reservation|
      reservation.update(is_valid_reservation: false)
    end
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行しました。"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end

  def ensure_customer
    @customer = Customer.find(current_customer.id)
  end

  def ensure_guest_user
    @customer = Customer.find(current_customer.id)
    if @customer.last_name == "guest_" && @customer.first_name == "user"
      redirect_to customers_mypage_path(current_customer) , notice: 'guest_userはアカウント情報編集画面へ遷移できません。'
    end
  end

end
