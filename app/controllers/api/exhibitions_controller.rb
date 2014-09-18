class Api::ExhibitionsController < Api::BaseController
  
  def index
    @exhibitions = Exhibition.includes(:group).all
    render json: @exhibitions
  end
end
