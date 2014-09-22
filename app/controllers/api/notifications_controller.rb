class Api::NotificationsController < Api::BaseController

  def index
     @notifications = Notification.all
     render json: @notifications
  end
end
