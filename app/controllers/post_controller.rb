class PostController < ApplicationController
  before_action :checkSession, only: [:new, :create]

  def index
  end

  def new
  end

  def create
  end

  private def checkSession
    redirect_to post_index_path unless sign_in?
  end
end
