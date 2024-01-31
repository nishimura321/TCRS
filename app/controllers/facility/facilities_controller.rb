class Facility::FacilitiesController < ApplicationController
  before_action :authenticate_facility!
  before_action :ensure_facility, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
  end

  private
  def ensure_facility
    @facility = Facility.find(params[:id])
  end
  
end
