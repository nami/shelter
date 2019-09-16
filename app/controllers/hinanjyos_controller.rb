require "google/cloud/translate"

class HinanjyosController < ApplicationController
  before_action :find_shelter, only: [:show, :edit, :update, :destroy, :favorite]
  skip_before_action :authenticate_user!

  def index
    @shelters = policy_scope(Hinanjyo).where.not(latitude: nil, longitude: nil)
    # for search bar in shelters page
    # if nothing is searched
    if params[:location].present? && disaster.nil?
      # show all markers
      @markers = @shelters.near(params[:location], 3).first(30)
    # if in session there is a disaster that was searched before
    # filter by disaster type and location
    elsif disaster.present? && params[:location].present?
      @markers = Hinanjyo.near(params[:location], 3).first(30)
      @markers = @markers.select do |shelter|
        @choice_disaster = session[:disaster].to_sym
        shelter[@choice_disaster] == true
      end
    # if in session there is a user longlat & disaster that was searched before
    # filter by disaster type, searched location & user location
    elsif disaster.present? && longlat.present?
      @markers = @shelters.near([longlat[0], longlat[1]], 3).first(30)
      @markers = @markers.select do |shelter|
        @choice_disaster = session[:disaster].to_sym
        shelter[@choice_disaster] == true
      end
    else
      # else just search by location
      @markers = @shelters
    end

    # for home page
    # filter by earthquakes
    if params[:eq_form].present?
      @user_disaster = params[:eq_form][:disaster]
      @user_longitude = params[:eq_form][:longitude]
      @user_latitude = params[:eq_form][:latitude]
    end

    # filter by tsunami
    if params[:tsu_form].present?
      @user_disaster = params[:tsu_form][:disaster]
      @user_longitude = params[:tsu_form][:longitude]
      @user_latitude = params[:tsu_form][:latitude]
    end

    # filter by mudslides
    if params[:mud_form].present?
      @user_disaster = params[:mud_form][:disaster]
      @user_longitude = params[:mud_form][:longitude]
      @user_latitude = params[:mud_form][:latitude]
    end

    # filter by floods
    if params[:flood_form].present?
      @user_disaster = params[:flood_form][:disaster]
      @user_longitude = params[:flood_form][:longitude]
      @user_latitude = params[:flood_form][:latitude]
    end

    # filter by high tide
    if params[:tide_form].present?
      @user_disaster = params[:tide_form][:disaster]
      @user_longitude = params[:tide_form][:longitude]
      @user_latitude = params[:tide_form][:latitude]
    end

    # filter by fire
    if params[:fire_form].present?
      @user_disaster = params[:fire_form][:disaster]
      @user_longitude = params[:fire_form][:longitude]
      @user_latitude = params[:fire_form][:latitude]
    end

    # filter by pipe
    if params[:pipe_form].present?
      @user_disaster = params[:pipe_form][:disaster]
      @user_longitude = params[:pipe_form][:longitude]
      @user_latitude = params[:pipe_form][:latitude]
    end

    # filter by volcano
    if params[:volcano_form].present?
      @user_disaster = params[:volcano_form][:disaster]
      @user_longitude = params[:volcano_form][:longitude]
      @user_latitude = params[:volcano_form][:latitude]
    end

    # search if user coordinates are present and disaster is selected
    if @user_disaster.present? && @user_longitude.present?
      @shelters = Hinanjyo.near([@user_latitude, @user_longitude], 3).first(30)
      @shelters = @shelters.select do |shelter|
        @choice_disaster = @user_disaster.to_sym
        shelter[@choice_disaster] == true
      end
      session[:longitude] = @user_longitude
      session[:latitude] = @user_latitude
      session[:disaster] = @user_disaster
      @markers = @shelters
    # search if disaster is present
    elsif @user_disaster.present?
      @disaster = @user_disaster
      @shelters = Hinanjyo.where("#{@disaster} = true").first(30)
      @markers = @shelters
      session[:disaster] = @user_disaster
    end

    # markers according to search parameters
    @markers = @markers.map do |marker|
      {
        lat: marker.latitude,
        lng: marker.longitude,
        infoWindow: { content: render_to_string(partial: "hinanjyos/infowindow", locals: { marker: marker }) }
      }
    end
  end

  def show
    authorize @shelter
    if params[:category].present?
      @posts = @shelter.posts.where(completed: false).tagged_with(params[:category])
    else
      @posts = @shelter.posts.where(completed: false)
    end
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

  # save disaster searched in session
  def disaster
    if @user_disaster.present?
      session[:disaster] = @user_disaster
    end
    return session[:disaster]
  end

  # save long & lat searched in session
  def longlat
    if @user_longitude.present? && @user_latitude.present?
      session[:longitude] = @user_longitude
      session[:latitude] = @user_latitude
    end
    return [session[:latitude], session[:longitude]]
  end
end
