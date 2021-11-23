class ActivitiesController < ApplicationController

  def new
    authorize @Activity
  end
end
