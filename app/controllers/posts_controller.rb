class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def show
  end

  def new
    @post = Post.new
    authorize @post
    @shelter = Hinanjyo.find(params[:shelter_id])
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.user = current_user
    shelter = Hinanjyo.find(params[:shelter_id])
    @post.hinanjyo = shelter
    if @post.save
      redirect_to shelter_path(shelter)
    else
      render :new
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :user_id, :photo, :hinanjyo_id, :tag_list)
  end
end
