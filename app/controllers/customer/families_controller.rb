class Customer::FamiliesController < ApplicationController
  #before_action :authenticate_customer!
  before_action :ensure_family, only: [:show, :edit, :update, :destroy]

  def new
    @family = Family.new(customer_id: current_customer.id)
  end

  def create
    @family = Family.new(family_params.merge(customer_id: current_customer.id))
    if @family.save
      flash[:notice] = "家族の登録が完了しました。"
        redirect_to customers_mypage_path(current_customer)
    else
      flash.now[:notice] = "家族の登録ができませんでした。"
      render :new
    end
  end

  def edit
  end

  def update
    if @family.update(family_params)
      flash[:notice] = "修正が完了しました。"
      redirect_to customers_mypage_path(current_customer)
    else
      flash.now[:notice] = "修正の保存に失敗しました。"
      render :edit
    end
  end

  def destroy
  end

private

  def family_params
    params.require(:family).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :male, :relationship, :birthday,:telephone_number, :workplace, :workplace_telephone_number, :is_active)
  end

  def ensure_family
    @family = Family.find(params[:id])
  end
end
