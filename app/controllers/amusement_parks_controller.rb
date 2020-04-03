class AmusementParksController < ApplicationController

  def index

  end

  def show
    @amusement_park = AmusementPark.find(params[:id])
  end
end