class ActivitiesController < ApplicationController
  before_action :find, only:[:show,:destroy]

  def new
    @activity = Activity.new
    # authorize @activity
  end

  def show
    @user_activity = UserActivity.find_by(activity_id: @activity, user_id: current_user)
    @comment = Comment.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end

    # authorize @activity
  end

  def destroy
    @activity.delete
    redirect_to activitys_path
  end

  private

  def find
    @activity = Activity.find(params[:id])
    # authorize @activity
  end

  def activity_params
    params.require(:activity).permit(:localisation, :date, :description, :sport_id)
  end
end
