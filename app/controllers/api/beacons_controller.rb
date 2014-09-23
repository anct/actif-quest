class Api::BeaconsController < Api::BaseController

  def index
    @beacons = Beacon.includes(:bound).all
    render json: @beacons
  end
end
