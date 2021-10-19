class MealsController < InheritedResources::Base
  
    def meal_params
      params.require(:meal).permit(:id, :title, :recipe, :user, :created, :due_date, :group_id, :tags, :upvotes, group_attributes: [:id, :name])
    end

    def index
      @meals = Meal.all
    end

    def show
      @meals = Meal.find( params[:id] )
      @comment = Comment.new(:meal => @meals)
    end

    def edit

    end

    def update

    end

    def new
      @meals = Meal.new
    end

    def create
      @meals = Meal.new(meal_params)
      @meals.user = current_user
      if @meals.save
        MealMailer.with(new_title: @meals.title).meal_created.deliver_now
        redirect_to meals_path, notice: 'Success'
      else
        render 'new'
      end
    end

    def destroy

    end

end
