class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @activities_mine = current_user.activities

  # purpose is to fetch an array of users_activities, with the same activity for a user
    @user_activities_by_user = current_user.user_activities
    raise

  end
end
