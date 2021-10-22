class ApplicationController < ActionController::Base
  respond_to :js, :json
  helper_method :all_meals
  helper_method :all_groups
  PAGING_HELPER = 10

  def all_meals
    @meals = Meal.all
  end

  def all_groups
    @groups = Group.all
  end

  def all_tags
    @tags = Tags.all
  end

  def authenticate_admin!
    # authenticate_user!
     unless current_user.admin?
       redirect_to home_index_path, status: :forbidden
       flash[:alert] = "You are not allowed to do what you were trying to do there so i stopped you. It was a nice try though!"
     end

  end

  def approval_check
   unless current_user.approved?
     redirect_to home_index_path, status: :forbidden
     flash[:alert] = "You are not approved by an admin of this Site so i have to log you out. Sorry :)"
     sign_out(current_user)
   end
  end
  # heroku run:detached rake db:migrate
end
