class Api::BoundsController < Api::BaseController
  before_action :set_bound, only: [:check_in]

  def index
    @bounds = Bound.all
    render json: @bounds
  end

  def check_in
    @check_in = current_user.check_in(@bound)
    render json: @bound, status: :created
  end
  
  private
    def set_bound
      @bound = Bound.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {error: { message: 'That bound does not exist.' }}, status: :not_found
    end
end
