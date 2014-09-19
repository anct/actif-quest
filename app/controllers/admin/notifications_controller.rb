class Admin::NotificationsController < Admin::BaseController
  before_action :set_admin_notification, only: [:show, :edit, :update, :destroy]

  def index
    @notifications = Notification.all
  end

  def show
  end

  def new
    @notification = Notification.new
  end

  def edit
  end

  def create
    @notification = Notification.new(admin_notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to admin_notifications_url, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @notification.update(admin_notification_params)
        format.html { redirect_to admin_notification_url, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to admin_notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_notification_params
      params.require(:notification).permit(:content)
    end
end