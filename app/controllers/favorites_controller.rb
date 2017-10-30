class FavoritesController < ApplicationController
  before_action :logged_in?

  def index
    user = current_user
    @favorites = Favorite.where(user_id: user.id).sort_by_category
    if @favorites.empty?
      flash[:empty] = "You currently have no favorites"
      redirect_to gifs_path
    else
      render :index
    end
  end

  def create
    @favorite = Favorite.new(user_id: current_user.id, gif_id:params[:gif_id])
    if @favorite.save
      flash[:save] = "Your favorite has been saved"
    else
      flash[:error] = "Something went wrong, please try again"
    end
      direct_to_gifs
  end

  def destroy
    favorite = Favorite.find(params[:id])
    flash[:unfavorite] = "Successfully Unfavorited"
    favorite.destroy
    redirect_to favorites_path
  end

  private
    def logged_in?
      render_404 unless current_user
    end

    def direct_to_gifs
      if admin?
        redirect_to admin_gifs_path
      else
        redirect_to gifs_path
      end
    end
end
