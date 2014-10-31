class Api::UsersController < Api::BaseController
  skip_before_action :authenticate_user_from_token!, only: [:create]
  skip_before_action :authenticate_user!, only: [:create]

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_registration_param).tap do |user|
      user.screen_name = user.name
      password = SecureRandom.urlsafe_base64
      user.password = password
      user.password_confirmation = password
    end
    @user.save!
    render json: @user, status: :created
  rescue ActiveRecord::RecordInvalid
    if User.where(name: @user.name).present?
      render json: { error: { message: 'That user name has already existed.' } }, status: :conflict
    else
      render json: { error: { message: 'That name is invalid format.' } }, status: :bad_request
    end
  end

  private 

    def user_registration_param
      params.require(:user).permit(:name)
    end
end
