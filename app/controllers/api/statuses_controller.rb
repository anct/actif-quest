class Api::StatusesController < Api::BaseController

  def index
    @statuses = Status.includes(:user).all
    render json: @statuses
  end
end
