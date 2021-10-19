class ApplicationController < ActionController::Base

  helper_method :all_meals
  helper_method :all_groups

  def all_meals
    @meals = Meal.all
  end

  def all_groups
    @groups = Group.all
  end

  def all_tags
    @tags = Tags.all
  end
  # heroku run:detached rake db:migrate
end
