class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @activity = Activity.find(params[:activity_id])
    @user_activity = UserActivity.where(activity_id: @activity, user_id: current_user)
  end

  def destroy
    @comment.delete
  end

   private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
