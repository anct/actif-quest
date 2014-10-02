class Admin::TreasuresController < Admin::BaseController
  before_action :set_admin_treasure, only: [:show, :edit, :update, :destroy]

  def index
    @treasures = Treasure.all
  end

  def show
  end

  def new
    @treasure = Treasure.new
  end

  def edit
  end

  def create
    @treasure = Treasure.new(admin_treasure_params)

    respond_to do |format|
      if @treasure.save
        format.html { redirect_to admin_treasures_url, notice: 'Treasures was successfully created.' }
        format.json { render :show, status: :created, location: @treasure }
      else
        format.html { render :new }
        format.json { render json: @treasure.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @treasure.update(admin_treasure_params)
        format.html { redirect_to admin_treasures_url, notice: 'Treasures was successfully updated.' }
        format.json { render :show, status: :ok, location: @treasure }
      else
        format.html { render :edit }
        format.json { render json: @treasure.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @treasure.destroy
    respond_to do |format|
      format.html { redirect_to admin_treasures_url, notice: 'Treasure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_treasure
      @treasure = Treasure.find(params[:id])
    end

    def admin_treasure_params
      params.require(:treasure).permit(:content)
    end
end