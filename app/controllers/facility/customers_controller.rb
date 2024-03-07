class Facility::CustomersController < ApplicationController
  before_action :authenticate_facility!
  before_action :ensure_customer, only: [:show, :edit, :update, :withdrawal]

  def show
    @active_children = @customer.children.where(is_active: true)
    @active_families = @customer.families.where(is_active: true)
  end

  def update
    if @customer.update(customer_params)
      flash[:notice] = "メモの保存が完了しました。"
      redirect_to facility_customer_path(@customer.id)
    else
      @active_children = @customer.children.where(is_active: true)
      @active_families = @customer.families.where(is_active: true)
      flash.now[:notice] = "メモの保存ができませんでした。"
      render :show
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:administrator_notes)
  end

  def ensure_customer
    @customer = Customer.find(params[:id])
  end

end
