class UserActivitiesController < ApplicationController
  def create
    @user_activity = UserActivity.new
  end

  def destroy
    @user_activity.delete
    redirect_to user_path
  end
end
