class GifsController < ApplicationController
  def index
    @gifs = Gif.sort_by_category
  end
end
