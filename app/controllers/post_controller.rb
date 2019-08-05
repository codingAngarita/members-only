class PostController < ApplicationController
  before_action :checkSession, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if Post.create(post_params)
      flash[:notice] = "Post Successful"
      redirect_to post_index_path
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
    hash = params.require(:post).permit(:title, :content, :user_id, :user_username)
    user = current_user
    hash[:user_id] = user.id
    hash[:user_username] = user.username
    hash
  end
end
