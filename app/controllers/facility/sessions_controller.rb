# frozen_string_literal: true

class Facility::SessionsController < Devise::SessionsController
  before_action :facility_state, only: [:create]

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
    facility_top_path
  end

  def after_sign_out_path_for(resource)
    new_facility_session_path
  end

  private
  # 施設がアクティブであるかを判断するメソッド
  def facility_state
    # 【処理内容1】 入力されたemailから施設アカウントを1件取得
    facility = Facility.find_by(email: params[:facility][:email])
    # 【処理内容2】 施設アカウントを取得できなかった場合、このメソッドを終了する
    return if facility.nil?
    # 【処理内容3】 取得した施設のパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
    return unless facility.valid_password?(params[:facility][:password])
    # 【処理内容4】 アクティブな施設に対する処理
    if facility.is_active
      sign_in(facility)
      redirect_to after_sign_in_path_for(facility)
    # 【処理内容5】 アクティブでない施設に対する処理
    else
      flash[:notice] = "閉園済みです。再度登録をしてご利用ください。"
      redirect_to root_path
    end
  end

end
