class HinanjyosController < ApplicationController
  before_action :find_shelter, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!
  def index

    @shelters = policy_scope(Hinanjyo)

    @shelters = Hinanjyo.where.not(latitude: nil, longitude: nil)

    if params[:location].blank?
       @markers = @shelters
    else
      @markers = Hinanjyo.near(params[:location], 3)
    end

    @markers = @markers.map do |marker|
      {
        lat: marker.latitude,
        lng: marker.longitude
      }
    end

  end

  def show
    authorize @shelter

  end

  private

  def find_shelter
    @shelter = Hinanjyo.find(params[:id])
  end

end
