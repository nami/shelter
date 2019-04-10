class HinanjyosController < ApplicationController
  before_action :find_shelter, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!
  def index

    @shelters = policy_scope(Hinanjyo)

    @shelters = Hinanjyo.where.not(latitude: nil, longitude: nil)

    if params[:location].blank?
      @markers = policy_scope(Hinanjyo)
    elsif session[:disaster].present? && session[:location].present?
      @markers = Hinanjyo.where("#{session[:disaster]} = true")
      @markers = Hinanjyo.near(session[:location], 3)
    elsif session[:disaster].present?
      @markers = Hinanjyo.where("#{session[:disaster]} = true")
      @markers = Hinanjyo.near(params[:location], 3)
    else
      @markers = Hinanjyo.near(params[:location], 3)
      session[:location] = params[:location]
    end

    if params[:eq_form].present?
      if params[:eq_form][:disaster].present? && params[:eq_form][:longitude].present?
        @shelters = Hinanjyo.near([params[:eq_form][:longitude],params[:eq_form][:latitude]], 3)
        session[:disaster] = params[:eq_form][:disaster]
        @markers = @shelters
      elsif params[:eq_form][:disaster].present?
        @disaster = params[:eq_form][:disaster]
        @shelters = Hinanjyo.where("#{@disaster} = true")
        @markers = @shelters
        session[:disaster] = params[:eq_form][:disaster]
      end
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

  def disaster
    if params[:disaster].present?
      session[:disaster] = params[:disaster]
    end
    return session[:disaster]
  end

end
