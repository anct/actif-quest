class Api::BoundsController < Api::BaseController

  def index
    @bounds = Bound.all
    render json: @bounds
  end
end
