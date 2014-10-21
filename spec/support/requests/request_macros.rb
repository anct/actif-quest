module RequestMacros
  def sign_in_as_user_with_token
    FactoryGirl.create(:user).tap do |user|
      headers['Authorization'] = "Token token=#{user.authentication_token}"
      params['uid'] = user.uid
    end
  end

  def not_existed_id(model_class)
    ids = model_class.pluck(:id)
    id = ids.last
    loop { return id unless ids.include?(id+=1) }
  end
end
