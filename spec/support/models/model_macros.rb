module ModelMacros
  def auth_params
    OmniAuth::AuthHash.new(
      provider: 'twitter', uid: '123456',
      info: {
        nickname: 'izumin5210',
        name: 'Masayuki IZUMI',
        image: 'http://www.gravatar.com/avatar/fc8f452e8998fb66642a5313a7793293.jpg?s=512'
      },
      credentials: { token: 'a1b2c3d4', secret: 'abcdef1234', expires_at: 1321747205 }
    )
  end
end
