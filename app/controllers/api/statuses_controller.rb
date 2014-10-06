class Api::StatusesController < Api::BaseController
  before_action :set_status, only: [:favorite]

  def index
    @statuses = Status.includes(:user).page(params[:page]).per(100)
    render json: @statuses
  end

  def create
    @status = current_user.post(status_params[:body])
    render json: @status, status: :created
  end

  def favorite
    @favorite = current_user.fav(@status)
    render json: @status, status: :created
  end

  private
    def set_status
      @status = Status.find(params[:id])
    end

    def status_params
        params.require(:status).permit(:user, :body)
    end
end
