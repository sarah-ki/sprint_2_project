class MealsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :approval_check

  
    def meal_params
      params.require(:meal).permit(:id, :title, :recipe, :user, :created, :due_date, :group_id, :upvotes, group_attributes: [:id, :name], tag_ids: [])
    end

    def index
      @page = params.fetch(:page, 0).to_i
      @meals = Meal.offset(@page * PAGING_HELPER).limit(PAGING_HELPER)
    end

    def show
      @meal = Meal.find( params[:id] )
      @comment = Comment.new(:meal => @meal)
    end

    def edit
      @meals = Meal.find( params[:id] )
    end

    def update
      @meals = Meal.edit(params[:id])
    end

    def new
      @meals = Meal.new
    end

    def create
      @meals = Meal.new(meal_params)
      @meals.user = current_user.email
      if @meals.save
        MealMailer.with(new_title: @meals.title).meal_created.deliver_now

        redirect_to meals_path, notice: 'Success'
      else
        render 'new'
      end
    end

    def destroy

    end

    def search
      if params[:q].blank?
        redirect_to meals_path
      else
        @results = Meal.all.where("lower(title) LIKE ?", "%"+params[:q]+"%")
      end
    end

end
