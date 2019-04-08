class HinanjyosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @shelters = Hinanjyo.all
  end
end
