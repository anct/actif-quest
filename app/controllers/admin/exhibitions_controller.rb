class Admin::ExhibitionsController < Admin::BaseController
  before_action :set_admin_exhibition, only: [:show, :edit, :update, :destroy]
  before_action :set_groups, only: [:new, :edit]

  # GET /admin/exhibitions
  # GET /admin/exhibitions.json
  def index
    @exhibitions = Exhibition.all
  end

  # GET /admin/exhibitions/1
  # GET /admin/exhibitions/1.json
  def show
  end

  # GET /admin/exhibitions/new
  def new
    @exhibition = Exhibition.new
  end

  # GET /admin/exhibitions/1/edit
  def edit
  end

  # POST /admin/exhibitions
  # POST /admin/exhibitions.json
  def create
    @exhibition = Exhibition.new(admin_exhibition_params)

    respond_to do |format|
      if @exhibition.save
        format.html { redirect_to admin_exhibitions_url, notice: 'Exhibition was successfully created.' }
        format.json { render :show, status: :created, location: @exhibition }
      else
        format.html { render :new }
        format.json { render json: @exhibition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/exhibitions/1
  # PATCH/PUT /admin/exhibitions/1.json
  def update
    respond_to do |format|
      if @exhibition.update(admin_exhibition_params)
        format.html { redirect_to admin_exhibitions_url, notice: 'Exhibition was successfully updated.' }
        format.json { render :show, status: :ok, location: @exhibition }
      else
        format.html { render :edit }
        format.json { render json: @exhibition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/exhibitions/1
  # DELETE /admin/exhibitions/1.json
  def destroy
    @exhibition.destroy
    respond_to do |format|
      format.html { redirect_to admin_exhibitions_url, notice: 'Exhibition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_exhibition
      @exhibition = Exhibition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_exhibition_params
      params.require(:exhibition).permit(:name, :introduction, :image_url, :group_id)
    end

    def set_groups
      @groups = Group.all
    end
end
