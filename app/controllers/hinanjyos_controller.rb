class HinanjyosController < ApplicationController
  skip_before_action :authenticate_user!
  def index
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
end
