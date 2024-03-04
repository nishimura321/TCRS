class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_customer, only: [:show, :edit, :update]

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @active_children = @customer.children.where(is_active: true)
    @active_families = @customer.families.where(is_active: true)
  end

  private
  def ensure_customer
    @customer = Customer.find(params[:id])
  end

end
