class Api::TreasuresController < Api::BaseController
  
  def index
    @treasures = Treasure.all
    render json: @treasures
  end
end
