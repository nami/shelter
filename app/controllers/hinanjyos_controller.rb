class HinanjyosController < ApplicationController
  before_action :find_shelter, only: [:show, :edit, :update, :destroy, :favorite]
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
      @user_disaster = params[:eq_form][:disaster]
      @user_longitude = params[:eq_form][:longitude]
      @user_latitude = params[:eq_form][:latitude]
    end

    if params[:tsu_form].present?
      @user_disaster = params[:tsu_form][:disaster]
      @user_longitude = params[:tsu_form][:longitude]
      @user_latitude = params[:tsu_form][:latitude]
    end

    if @user_disaster.present? && @user_longitude.present?
      @shelters = Hinanjyo.where("#{@disaster} = true")
      @shelters = Hinanjyo.near([@user_longitude,@user_latitude], 3)
      session[:disaster] = @user_disaster
      @markers = @shelters
    elsif @user_disaster.present?
      @disaster = @user_disaster
      @shelters = Hinanjyo.where("#{@disaster} = true")
      @markers = @shelters
      session[:disaster] = @user_disaster
    end

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

  def disaster
    if params[:disaster].present?
      session[:disaster] = params[:disaster]
    end
    return session[:disaster]
  end

end
