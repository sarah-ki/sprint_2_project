class TagsController < ApplicationController
  before_action :set_tag,  only: %i[ show destroy update]
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

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path, notice: 'Success creating new tag'
    else
      render 'new'
      flash[:alert] = "There was an error creating a new tag. Please try again or contact an admin!"
    end
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def add_use
    @tag.uses += 1
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path, notice: "Tag has been edited"
    else
      render 'edit'
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag.destroy
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :uses, meal_ids: [])
  end

end
