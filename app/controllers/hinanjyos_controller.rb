class HinanjyosController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @shelters = Hinanjyo.all
  end
end
