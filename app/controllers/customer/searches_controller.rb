class Customer::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @word = params[:word]
    @model = params[:model]
    @search = params[:search]
    @facility = Facility.find(params[:facility])

    if @model == "Menu"
      @records = Menu.search_for(@word, @search, @facility)
    else
      @records = Facility.search_for(@word, @search)
    end
  end

end
