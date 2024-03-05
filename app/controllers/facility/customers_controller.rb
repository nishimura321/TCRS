class Facility::CustomersController < ApplicationController
  before_action :authenticate_facility!
  before_action :ensure_customer, only: [:show, :edit, :update, :withdrawal]

  def show
    @active_children = @customer.children.where(is_active: true)
    @active_families = @customer.families.where(is_active: true)
  end

  def update
    if @reservation.update(reservation_params)
      flash[:notice] = "メモの保存が完了しました。"
      redirect_to facility_customer_path(@reservation.id)
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
    params.require(:customer).permit(:administrator_notes)
  end

  def ensure_customer
    @customer = Customer.find(params[:id])
  end
  
end
