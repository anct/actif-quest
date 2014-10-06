class Api::StatusesController < Api::BaseController
  before_action :set_status, only: [:destroy, :favorite, :unfav]

  def index
    @statuses = Status.includes(:user).page(params[:page]).per(100)
    render json: @statuses
  end

  def create
    @status = current_user.post(status_params[:body])
    render json: @status, status: :created
  end

  def destroy
    @favorite =current_user.destroy(@status)
    render json: @status, status: :no_content
  end

  def favorite
    @favorite = current_user.fav(@status)
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
      params.require(:status).permit(:user, :body)
    end
end
