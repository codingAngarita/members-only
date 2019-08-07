class PostsController < ApplicationController
  before_action :checkSession, only: [:new, :create, :edit, :destroy, :update]

  def destroy
    @post = Post.find(params[:id])
    if check_owner
      @post.destroy
      flash[:notice] = "Your post has been deleted successfuly"
      redirect_to root_path
    end
  end

  def update
    if Post.find(params[:id]).update(post_params)
      flash[:notice] = "Your post has been edited successfuly"
      redirect_to root_path
    else
      flash[:warning] = "There has been a problem editing your post, please try again later"
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    check_owner
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.user_username = current_user.username
    if @post.save
      flash[:notice] = "Post Successful"
      redirect_to root_path
    else
      flash.now[:warning] = "Post not saved, something went wrong"
      render "new"
    end
  end

  private
  def check_owner
    if current_user.id != @post.user_id
      flash[:warning] = "The post you tried to modify is not linked to the user signed in"
      redirect_to new_session_path
      return false
    else
      return true
    end
  end

  def checkSession
    redirect_to new_session_path unless sign_in?
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
