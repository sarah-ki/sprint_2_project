class GroupsController < InheritedResources::Base
  before_action :set_group, only: %i[ show edit update destroy join leave]
  before_action :authenticate_user!


    def group_params
      params.require(:group).permit(:name, :description, :pw, :id, user_ids: [])
    end

  def index
    @groups = Group.all
  end

  def show
    @title = @group.name
    @meals = @group.meals
    #@users = @group.user_ids
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def join
    if !(@group.user_ids.include?(current_user.id))
      @group.users << current_user
      flash[:notice] = "User joined"
    else
      flash[:alert] = "User already in group"
      end
      redirect_to group_path(@group)

  end

  def leave

  end

end
