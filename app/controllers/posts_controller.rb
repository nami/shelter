class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy]
  before_action :find_shelter, except: [:index, :show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def show
    @post = Post.includes(comments: :user).find(params[:id])
    authorize @post
    @shelter = Hinanjyo.find(@post.hinanjyo_id)
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.user = current_user
    @post.hinanjyo = @shelter
    if @post.save
      redirect_to shelter_path(@shelter)
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to post_path(params[:id])
    else
      render :new
    end
  end

  def destroy
    authorize @post
    @shelter = Hinanjyo.find(@post.hinanjyo_id)
    if @post.destroy
      flash[:notice] = "Post Deleted"
      redirect_to shelter_path(@shelter)
    else
      flash[:alert] = "Post could not be deleted"
      redirect_to post_path(params[:id])
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def find_shelter
    @shelter = Hinanjyo.find(params[:shelter_id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :user_id, :photo, :hinanjyo_id, tag_list: [])
  end
end
