class HinanjyosController < ApplicationController
  before_action :find_shelter, only: [:show, :edit, :update, :destroy, :favorite]
  skip_before_action :authenticate_user!
  def index

    @shelters = policy_scope(Hinanjyo)

    @shelters = Hinanjyo.where.not(latitude: nil, longitude: nil)

    # for search bar in shelters page
    # if nothing is searched
    if params[:location].blank?
      # show all markers
      @markers = policy_scope(Hinanjyo)
    # if in session there is a disaster that was searched before
    # filter by disaster type and location
    elsif disaster.present? && params[:location].present?
      @markers = Hinanjyo.near(params[:location], 3)
      @markers = @markers.select do |shelter|
        @choice_disaster = session[:disaster].to_sym
        shelter[@choice_disaster] == true
      end
    else
      # else just search by location
      @markers = Hinanjyo.near(params[:location], 3)
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

    # search if user coordinates are present and disaster is selected
    if @user_disaster.present? && @user_longitude.present?
      @shelters = Hinanjyo.near([@user_longitude, @user_latitude], 3)
      @shelters = @shelters.select do |shelter|
        @choice_disaster = @user_disaster.to_sym
        shelter[@choice_disaster] == true
      end
      session[:disaster] = @user_disaster
      @markers = @shelters
    # search if disaster is present
    elsif @user_disaster.present?
      @disaster = @user_disaster
      @shelters = Hinanjyo.where("#{@disaster} = true")
      @markers = @shelters
      session[:disaster] = @user_disaster
    end

    # markers according to search parameters
    @markers = @markers.map do |marker|
      {
        lat: marker.latitude,
        lng: marker.longitude,
        infoWindow: { content: render_to_string(partial: "infowindow", locals: { marker: marker }) }
        # Uncomment the above line if you want each of your markers to display a info window when clicked
        # (you will also need to create the partial "/flats/map_box")
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

  # save disasiter searched in session
  def disaster
    if @user_disaster.present?
      session[:disaster] = @user_disaster
    end
    return session[:disaster]
  end

end
