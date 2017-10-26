class Admin::CategoriesController < Admin::BaseController
  before_action :downcase_params, only: :create

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
    redirect_to admin_gifs_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def downcase_params
      category_params[:name].downcase!
    end
end
