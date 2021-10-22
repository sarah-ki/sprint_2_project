class CommentsController < InheritedResources::Base

    def comment_params
      params.require(:comment).permit( :body, :id)
    end

  def create

    @comment = Comment.new(comment_params.merge(meal_id: params[:meal_id], name: current_user.email))
    respond_to do |format|
    if @comment.save
      format.js
      #  redirect_to (@comment.meal), :notice => "Successfully commented"
    else
      flash[:notice] = "Error creating this _comment.html.erb"
      redirect_to(@comment.meal)
    end
    end
  end

end
