class Api::StatusesController < Api::BaseController
  before_action :set_status, only: [:destroy, :fav, :unfav]

  def index
    @statuses = Status.includes(:user).page(params[:page]).per(100)
    render json: @statuses
  end

  def create
    @status = current_user.post(status_params[:body])
    render json: @status, status: :created
  rescue ActiveRecord::RecordInvalid
    render json: { error: { message: 'That status body is invalid.' } }, status: :bad_request
  rescue ArgumentError
    render json: { error: { message: 'That status body is empty.' } }, status: :bad_request
  end

  def destroy
    @favorite =current_user.destroy(@status)
    render json: @status, status: :no_content
  end

  def fav
    @fav = current_user.fav(@status)
    render json: @status, status: :created
  end

  def unfav
    @unfav = current_user.unfav(@status)
    render json: @status, status: :no_content
  end

  private
    def set_status
      @status = Status.find(params[:id])
    end

    def status_params
      params.require(:status).permit(:body)
    end
end
