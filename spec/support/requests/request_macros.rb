module RequestMacros
  def sign_in_as_user_with_token
    FactoryGirl.create(:user).tap do |user|
      headers['Authorization'] = "Token token=#{user.authentication_token}"
      params['uid'] = user.uid
    end
  end
end
