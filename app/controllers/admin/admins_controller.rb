class Admin::AdminsController < Admin::BaseController
  before_action :set_admin, only: [:show, :destroy]

  def index
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admin_admins_url, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admin_admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end

    def set_admin
      @admin = Admin.find(params[:id])
    end
end