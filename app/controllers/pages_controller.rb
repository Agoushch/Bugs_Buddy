class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @activities_mine = current_user.activities
    @user_activities_by_user = current_user.user_activities
  end
end
