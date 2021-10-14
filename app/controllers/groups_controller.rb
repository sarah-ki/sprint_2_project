class GroupsController < InheritedResources::Base
  before_action :set_group, only: %i[ show edit update destroy ]


    def group_params
      params.require(:group).permit(:members, :name, :description, :pw, :id)
    end

  def index
    @groups = Group.all
  end

  def show
    @title = @group.name
    @meals = @group.meals
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
