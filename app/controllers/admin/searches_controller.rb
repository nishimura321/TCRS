class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @word = params[:word]
    @model = params[:model]
    @search = params[:search]

    if @model == "Facility"
      @records = Facility.search_for(@word, @search)
    elsif @model == "Customer"
      @records = Customer.search_for(@word, @search)
    else
      if params[:facility].present?
        @facility = Facility.find(params[:facility])
      end
      @records = Reservation.search_for(@word, @search, @facility)
    end
  end

end
