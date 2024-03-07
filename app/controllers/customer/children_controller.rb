class Customer::ChildrenController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_child, only: [:show, :edit, :update, :destroy]

  def new
    session[:registration_child_count] ||= 0
    @customer = Customer.find(current_customer.id)
    @child = Child.new(customer_id: current_customer.id)
  end

  def create
    session[:registration_child_count] += 1
    @child = Child.new(child_params.merge(customer_id: current_customer.id))
    if @child.save
      flash[:notice] = "お子さまの登録が完了しました。"
      if current_customer.children.count > 1
        redirect_to customers_mypage_path(current_customer)
      else
        redirect_to new_family_path
      end
    else
      flash.now[:notice] = "お子さまの登録ができませんでした。"
      render :new
    end
  end

  def edit
  end

  def update
    if @child.update(child_params)
      flash[:notice] = "修正が完了しました。"
      redirect_to customers_mypage_path(current_customer)
    else
      flash.now[:notice] = "修正の保存に失敗しました。"
      render :edit
    end
  end

  def disable_child
    child = Child.find(params[:id])
    child.update(is_active: false)
    flash[:notice] = "指定されたお子さま情報を無効にしました。"
    redirect_to customers_mypage_path(current_customer)
  end

  private
  def child_params
    params.require(:child).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :male, :normal_body_temperature,
    :fever, :has_febrile_seizure, :febrile_seizure_details, :has_dislocation, :dislocation_details, :has_allergy, :allergy_details, :breastfeeding_status,
    :breastfeeding_amount, :situation_after_breastfeeding, :milk_situation_after_baby_food, :amount_of_milk_after_baby_food, :baby_food_progress, :appetite,
    :favorite_food, :hated_food, :how_to_eat, :meal_time, :how_to_lay_it_down, :falling_asleep, :waking_up, :sleeping_position, :is_deep_sleep, :habits_when_sleeping,
    :diaper_usage, :is_sensitive_to_rash, :urination, :defecation, :number_of_defecation, :favorite_game, :favorite_toy, :hospital_name, :hospital_telephone_number,
    :memo, :is_active)
  end

  def ensure_child
    @child = Child.find(params[:id])
  end

end