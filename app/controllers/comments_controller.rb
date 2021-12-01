class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @user_activity = UserActivity.find(params[:user_activity_id])
    @comment.user_activity = @user_activity
    @comment.save
    if @comment.save
     redirect_to activity_path(@user_activity.activity, anchor: "comment-#{@comment.id}")
    else
     render 'activities/show'
    end
  end

  def destroy
    @comment.delete
  end

   private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
