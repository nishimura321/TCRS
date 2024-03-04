class Facility::CustomersController < ApplicationController
  before_action :authenticate_facility!
  before_action :ensure_customer, only: [:show, :edit, :update, :withdrawal]

  def show
    @customer = Customer.new
    @active_children = @customer.children.where(is_active: true)
    @active_families = @customer.families.where(is_active: true)
  end

  def create
    @customer = Customer.new(customer_params)
    if @reservation.save
      flash[:notice] = "メモの保存が完了しました。"
      redirect_to reservations_thanks_path(id: @reservation.id)
    else
      @active_children = @customer.children.where(is_active: true)
      @active_families = @customer.families.where(is_active: true)
      flash.now[:notice] = "メモの保存ができませんでした。"
      render :show
    end
  end
  
  def withdrawal
    @customer.update(is_active: false)
    flash[:notice] = "退会処理を実行しました。"
    redirect_to facility_customer_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end

  def ensure_customer
    @customer = Customer.find(params[:id])
  end
  
end
