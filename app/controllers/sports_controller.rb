class SportsController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]
  def index
    if params[:query].present? && params[:type].present?
      cat = Category.find_by(name: params[:query])
      @sports = cat.sports
    elsif params[:query].present?
      sql_query = "kind ILIKE :query"
      @sports = Sport.where(sql_query, query: "%#{params[:query]}%")
    else
      @sports = Sport.all
    end
    @recommended = Sport.first(4)
    @categories = Category.all
  end

  # def categories
  #   @sports = Sport.select {|sport| sport.category == ''}
  # end

  def new
    @sport = Sport.new
    # authorize @sport
  end

  def show
    @activity = Activity.new
    @activities = @sport.activities

    if params[:query].present?
      @activities = @activities.where(date: params[:query])
    else
      @sports = Sport.all
    end
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window: render_to_string(partial: "activities/info_window", locals: { activity: activity })
      }
    end
  end

  def create
    @sport = Sport.new(sport_params)
    # authorize @sport
  end

  def edit
  end

  def update
    @sport.update(sport_params)
    @sport.save
    redirect_to sports_path
  end

  def destroy
    @sport.delete
    redirect_to sports_path
  end

  private

  def find
    @sport = Sport.find(params[:id])
    # authorize @sport
  end

  def sport_params
    params.require(:sport).permit(:kind, :category_id, :photo)
  end
end
