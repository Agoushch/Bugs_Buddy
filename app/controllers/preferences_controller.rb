class PreferencesController < ApplicationController
  before_action :find, only: [:edit, :update, :destroy]
  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(preference_params)
    @preference.save
    redirect_to dashboard_path
  end

  def edit
  end

  def update
    @preference.update(preference_params)
    @preference.save
    if @preference.update(preference_params)
      redirect_to dashboard_path, notice: 'Preference was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @preference.delete
    redirect_to dashboard_path
  end

  private
  def find
    @preference = Preference.find(params[:id])
    # authorize @sport
  end

  def preference_params
    params.require(:preference).permit(:level, :sport_id, :user_id)
  end
end
