class HinanjyosController < ApplicationController
  before_action :find_shelter, only: [:show, :edit, :update, :destroy, :favorite]
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
    @posts = @shelter.posts
  end

  # routes added (favorite_shelter_path)
  # user calls 'favorite_shelter' method and toggle favorites
  # Set color to star icon depending on the status of favorite
  def favorite
    authorize @shelter
    current_user.favorite_shelter(@shelter)

    redirect_to shelter_path(@shelter)
  end

  private

  def find_shelter
    @shelter = Hinanjyo.find(params[:id])
  end

end
