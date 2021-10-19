class TagsController < InheritedResources::Base
  before_action :set_tag,  only: %i[ show edit update destroy ]
  before_action :authenticate_user!


  def index
    @tags = Tag.all
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
