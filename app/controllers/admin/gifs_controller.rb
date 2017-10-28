class Admin::GifsController < Admin::BaseController

  def index
    @gifs = Gif.sort_by_category
  end

  def destroy
    @gif = Gif.find(params[:id])
    @gif.destroy
    flash[:delete] = "Gif Successfully deleted!"
    redirect_to admin_gifs_path
  end

end
