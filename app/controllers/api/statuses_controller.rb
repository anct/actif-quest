class Api::StatusesController < Api::BaseController

  def index
    @statuses = Status.includes(:user).page(params[:page]).per(100)
    render json: @statuses
  end

  def create
    @status = current_user.post(status_params[:body])
    render json: @status, status: :created
  end

  private
    def status_params
        params.require(:status).permit(:user, :body)
    end
end
