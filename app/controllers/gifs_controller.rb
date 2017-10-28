class GifsController < ApplicationController
  def index
    if params[:sort] == "category"
      @gifs = Gif.sort_by_category
    else
      @gifs = Gif.all
    end
  end
end
