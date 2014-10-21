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
    if @vote.present?
      render json: @vote, status: :created
    else
      render json: { error: { message: 'That exhibition have already voted.' } }, status: :conflict
    end
  end

  private
    def set_exhibition
      @exhibition = Exhibition.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: { message: 'That exhibition does not exist.' } }, status: :not_found
    end
end
