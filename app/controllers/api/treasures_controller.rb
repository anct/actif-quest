class Api::TreasuresController < Api::BaseController

  def index
    @treasures = Treasure.all
    render json: @treasures
  end

  def show
    @treasure = Treasure.find(params[:id])
    render json: @user
  end
end
