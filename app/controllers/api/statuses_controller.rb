class Api::StatusesController < Api::BaseController

  def index
    @statuses = Status.includes(:user).page(params[:page]).per(100)
    render json: @statuses
  end
end
