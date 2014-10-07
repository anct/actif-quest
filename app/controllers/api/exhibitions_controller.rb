class Api::ExhibitionsController < Api::BaseController
  before_action :set_exhibition, only: [:show, :vote]

  def index
    @exhibitions = Exhibition.includes(:group).all
    render json: @exhibitions
  end

  def show
    render json: @exhibition
  end

  def vote
    @vote = current_user.vote(@exhibition)
    render json: @vote, status: :created
  end

  private
    def set_exhibition
      @exhibition = Exhibition.find(params[:id])
    end
end
