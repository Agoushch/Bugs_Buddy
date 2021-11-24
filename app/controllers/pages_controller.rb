class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @activities = Activity.all
    @user = current_user
    @user_activities_by_user = UserActivity.where(user: @user)
  end
end
