class CommentsController < InheritedResources::Base

    def comment_params
      params.require(:comment).permit(:name, :email, :body, :meal_id, :id)
    end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to (@comment.meal), :notice => "Successfully commented"
    else
      flash[:notice] = "Error creating this _comment.html.erb"
      redirect_to(@comment.meal)
    end
  end

end
