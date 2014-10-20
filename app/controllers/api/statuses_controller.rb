class Api::StatusesController < Api::BaseController
  before_action :set_status, only: [:fav, :unfav]
  before_action :set_user_status, only: [:destroy]

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
    current_user.destroy(@status)
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

    def set_user_status
      @status = current_user.statuses.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      if Status.where(id: params[:id]).present?
        render json: { error: { message: 'That status is not current user\'s.' } }, status: :forbidden
      else
        render json: { error: { message: 'That status does not exist.' } }, status: :not_found
      end
    end

    def status_params
      params.require(:status).permit(:body)
    end
end
