class Api::TreasuresController < Api::BaseController
  before_action :set_treasure, only: [:take, :show]

  def index
    @treasures = Treasure.all
    render json: @treasures
  end

  def show
    render json: @treasure
  end

  def take
    if current_user.take(@treasure)
      render json: @treasure, status: :created
    else
      render json: { error: { message: 'That treasure has already taken by current user.' } }, status: :conflict
    end
  end

  private
    def set_treasure
      @treasure = Treasure.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: { message: 'That treasure does not exist.'} }, status: :not_found
    end
end
