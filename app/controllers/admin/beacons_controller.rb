class Admin::BeaconsController < Admin::BaseController
	before_action :set_admin_beacon, only: [:edit, :update, :destroy]

	def new
		@beacon = Beacon.new
	end

	def new
		@beacon = Beacon.new
	end

	def edit
	end

	def create
		@beacon = Beacon.new(admin_beacon_params)

		respond_to do |format|
      if @beacon.save
        format.html { redirect_to admin_beacons_url, notice: 'Beacon was successfully created.' }
        format.json { render :show, status: :ok, location: @beacon }
      else
        format.html { render :edit }
        format.json { render json: @beacon.errors, status: :unprocessable_entity }
      end
    end
  end

    def update
    respond_to do |format|
      if @beacon.update(admin_beacon_params)
        format.html { redirect_to admin_beacons_url, notice: 'Beacon was successfully updated.' }
        format.json { render :show, status: :ok, location: @beacon }
      else
        format.html { render :edit }
        format.json { render json: @beacon.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to admin_beacons_url, notice: 'Beacon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_beacon
      @beacon = Beacon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_beacon_params
      params.require(:beacon).permit(:uuid, :minor, :major, :latitude, :longitude, :floor, :bound_id)
    end
end
