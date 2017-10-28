class FavoritesController < ApplicationController
  before_action :logged_in?

  def index
    user = current_user
    @favorites = Favorite.find_by(user_id: user.id)
    if @favorites == nil
      flash[:empty] = "You currently have no favorites"
      redirect_to gifs_path
    else
      render :index
    end
  end

  def create
    @favorite = Favorite.new
  end

  private
    def logged_in?
      render_404 unless current_user
    end
end
