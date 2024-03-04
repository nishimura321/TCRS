class Facility::MenusController < ApplicationController
  before_action :authenticate_facility!
  before_action :ensure_menu, only: [:show, :edit, :update]

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.facilities << Facility.find(params[:menu][:facility_id])
    if @menu.save
      flash[:notice] = "献立の登録が完了しました。"
      redirect_to facility_menus_path
    else
      flash.now[:notice] = "献立の登録ができませんでした。"
      render new_facility_menu_path
    end
  end

  def index
    @menus = current_facility.menus.page(params[:page]).per(25)
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      flash[:notice] = "献立の修正が完了しました。"
      redirect_to facility_menus_path
    else
      flash.now[:notice] = "献立の修正ができませんでした。"
      render 'edit'
    end
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to facility_menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:date, :school_lunch, :snack, :ingredient)
  end

  def ensure_menu
    @menu = Menu.find(params[:id])
  end

end