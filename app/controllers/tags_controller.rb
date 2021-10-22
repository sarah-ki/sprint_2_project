class TagsController < InheritedResources::Base
  before_action :set_tag,  only: %i[ show edit update destroy create new]
  before_action :authenticate_user!

  def index
    @page = params.fetch(:page, 0).to_i
    @tags = Tag.offset(@page * PAGING_HELPER).limit(PAGING_HELPER)
    @cloud_tags = Tag.all
  end

  def show
    @name = @tag.name
    @meals = @tag.meal_ids
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def add_use

    @tag.uses += 1
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :uses, meal_ids: [])
  end

end
