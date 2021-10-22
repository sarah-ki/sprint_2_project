class HomeController < ApplicationController
  def index
    @meals = Meal.all.where(due_date: Date.today.all_day)
    # @meals = Meal.all
  end
end
