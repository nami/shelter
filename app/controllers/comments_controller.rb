class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def show
  end

  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    @post = Post.find(params[:post_id])
    authorize @post
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@post) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "posts/show"}
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
