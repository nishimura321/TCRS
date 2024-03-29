class Customer::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "Menu"
      @menus = Menu.looks(params[:search], params[:word])
    else 
      @facilities = Facility.looks(params[:search], paras[:word])
    end
  end

end
