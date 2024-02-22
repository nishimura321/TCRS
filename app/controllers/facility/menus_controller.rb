class Facility::MenusController < ApplicationController
  before_action :authenticate_facility!
  before_action :ensure_menu, only: [:show, :edit, :update]

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:notice] = "献立の登録が完了しました。"
      redirect_to facility_menus_path
    else
      flash.now[:notice] = "献立の登録ができませんでした。"
      render new_facility_menu_path
    end
  end

  def index
    @menus = Menu.all
  end

  def edit
  end

  def update
  end
  
  def destroy
    
  end
  
  private
  
  def menu_params
    params.require(:menu).permit(:date, :school_lunch, :snack, :ingredient)
  end
  
  def ensure_menu
    @menu = Menu.find(params[:id])
  end
  
end
