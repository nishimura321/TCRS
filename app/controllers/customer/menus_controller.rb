class Customer::MenusController < ApplicationController
  before_action :authenticate_customer!

  def index
    @facility = Facility.find(params[:facility_id])
    @menus = @facility.menus.page(params[:page])
  end

end
