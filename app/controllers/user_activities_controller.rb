class UserActivitiesController < ApplicationController
  def create
    @user_activity = UserActivity.new
    @user_activity.user = current_user
    @activity = Activity.find(params[:activity_id])
    @user_activity.activity = @activity
    @user_activity.save!
    redirect_to activity_path(@activity)
  end

  def destroy
    @user_activity.delete
    redirect_to user_path
  end
end
