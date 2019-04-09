class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def show
  end

  private

  #add tag_list to user_paramsq
end
