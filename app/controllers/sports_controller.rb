class SportsController < ApplicationController
  before_action :find, only:[:show, :edit, :update, :destroy]
  def index
    @sports = Sport.all
  end

  def new
    @sport = Sport.new
    # authorize @sport
  end

  def show
    @activity = Activity.new
    @activities = @sport.activities
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
    @sport = sport.find(params[:id])
    authorize @sport
  end

  def sport_params
    params.require(:sport).permit(:type, :category)
  end
end
