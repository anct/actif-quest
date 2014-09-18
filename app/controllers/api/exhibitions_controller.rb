class Api::ExhibitionsController < Api::BaseController
  
  def index
    @exhibitions = Exhibition.includes(:group).all
    render json: @exhibitions
  end

  def show
    @exhibition = Exhibition.find(params[:id])
    render json: @exhibition
  end
end
