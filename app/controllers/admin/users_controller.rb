class Admin::UsersController < Admin::BaseController
  before_action :set_admin_user, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @user = User.find(params[:id])
    end
end
