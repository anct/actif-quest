class Api::BaseController < ApplicationController
  before_action :authenticate_user_from_token!
  before_filter :authenticate_user!

  def default_serializer_options
    { root: false }
  end

  private

    def authenticate_user_from_token!
      user = User.find_by(uid: params[:uid])
      if user.present?
        authenticate_or_request_with_http_token do |token, options|
          Devise.secure_compare(user.authentication_token, token) && sign_in(user, store: false)
        end
      end
    end
end
