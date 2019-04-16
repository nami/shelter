class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def persist_disaster_session
    session[:disaster] ||= params[:eq_form][:disaster]
  end

  def persist_location_session
    session[:location] ||= params[:eq_form][:location]
  end

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def self.renderer_with_signed_in_user(user)
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap { |i|
      i.set_user(user, scope: :user, store: false, run_callbacks: false)
    }
    renderer.new('warden' => proxy)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,
                                                       :last_name,
                                                       :sei,
                                                       :mei,
                                                       :sei_kana,
                                                       :mei_kana,
                                                       :role,
                                                       :phone,
                                                       :address,
                                                       :verified,
                                                       :photo_id,
                                                       :avatar])
  end
end
