class Api::AchievementsController < Api::BaseController

  def index
    @achievements = Achievement.all
    render json: @achievements
  end
end
