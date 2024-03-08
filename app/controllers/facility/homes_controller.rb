class Facility::HomesController < ApplicationController
  before_action :authenticate_facility!

  def top
    @reservations = current_facility.reservations.find(params[:id])
  end
end
