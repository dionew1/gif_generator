class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    json_gif = Gif.retrieve_gif(params[:category][:name])
    @category = Category.find_by(name: params[:category][:name])
    if @category == nil
      @category = Category.create(category_params)
    end
    @category.gifs.create(url: json_gif["data"]["image_url"])
    redirect_to admin_gifs_path(:admin)
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
