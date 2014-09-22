class Admin::BoundsController < Admin::BaseController
  before_action :set_admin_bound, only: [:show, :edit, :update, :destroy]

  def index
    @bounds = Bound.all
  end

  def show
    @beacons = @bound.beacons
  end

  def new
    @bound = Bound.new
  end

  def edit
  end

  def create
    @bound = Bound.new(admin_bound_params)

    respond_to do |format|
      if @bound.save
        format.html { redirect_to admin_bounds_url, notice: 'Bound was successfully created.' }
        format.json { render :show, status: :ok, location: @bound }
      else
        format.html { render :edit }
        format.json { render json: @bound.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bound.update(admin_bound_params)
        format.html { redirect_to admin_bounds_url, notice: 'Bound was successfully updated.' }
        format.json { render :show, status: :ok, location: @bound }
      else
        format.html { render :edit }
        format.json { render json: @bound.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to admin_bounds_url, notice: 'Bound was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_bound
      @bound = Bound.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_bound_params
      params.require(:bound).permit(:name)
    end
end
