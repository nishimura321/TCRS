class Facility::SearchesController < ApplicationController
  before_action :authenticate_facility!

  def search
    @word = params[:word]
    @model = params[:model]
    @search = params[:search]
    @facility = Facility.find(params[:facility])

    if @model == "Menu"
      @records = Menu.search_for(@word, @search, @facility)
    else
      @records = Reservation.search_for(@word, @search, @facility)
    end
  end

end
