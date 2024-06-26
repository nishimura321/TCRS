# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    customers_mypage_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  #ゲストログイン用メアクション
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to customers_mypage_path(customer), notice: 'guest_userでログインしました。'
  end

private
  # 会員がアクティブであるかを判断するメソッド
  def customer_state
    # 【処理内容1】 入力されたemailからアカウントを1件取得
    customer = Customer.find_by(email: params[:customer][:email])
    # 【処理内容2】 アカウントを取得できなかった場合、このメソッドを終了する
    return if customer.nil?
    # 【処理内容3】 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
    return unless customer.valid_password?(params[:customer][:password])
    # 【処理内容4】 アクティブな会員に対する処理
    if customer.is_active
      flash[:notice] = "ログインしました。"
      sign_in(customer)
      redirect_to after_sign_in_path_for(customer)
    # 【処理内容5】 アクティブでない会員に対する処理
    else
      flash[:notice] = "退会済みです。再度登録をしてご利用ください。"
      redirect_to new_customer_registration_path
    end
  end

end
