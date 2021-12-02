class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @activities_mine = current_user.activities
    @activities = current_user.user_activities.sort_by { |act| Activity.find_by(id: act.id)&.date}
  end
end
