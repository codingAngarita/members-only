class PostController < ApplicationController
  before_action :checkSession, only: [:new, :create]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    if Post.create(post_params)
      flash[:warning] = "Post Successful"
      redirect_to post_path
    else
      flash.now[:warning] = "Post not saved, something went wrong"
      render "new"
    end
  end

  private
  def checkSession
    redirect_to post_index_path unless sign_in?
  end

  def post_params
    user = current_user
    params[:post][:user_id] = user.id
    params.require(:post).permit(:title, :content, :user_id)
  end
end
