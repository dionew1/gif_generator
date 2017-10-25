class Admin::GifsController < ApplicationController
  def index
    @gifs = Gif.all
  end
end
