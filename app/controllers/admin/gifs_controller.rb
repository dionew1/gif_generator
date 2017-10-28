class Admin::GifsController < Admin::BaseController

  def index
    if params[:sort] == "category"
      @gifs = Gif.sort_by_category
    else
      @gifs = Gif.all
    end
  end

  def destroy
    @gif = Gif.find(params[:id])
    @gif.destroy
    flash[:delete] = "Gif Successfully deleted!"
    redirect_to admin_gifs_path
  end

end
