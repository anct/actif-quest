shared_examples 'token authenticatable' do
  describe '#ensure_authentication_token' do
    before do
      @object = FactoryGirl.build(eval(":#{described_class.name.underscore}"), authentication_token: nil)
      @object.ensure_authentication_token
    end
    context 'not yet set token' do
      it do
        before_token = @object.authentication_token
        @object.ensure_authentication_token
        expect(@object.authentication_token).to eq before_token
      end
    end
    context 'already set token' do
      it { expect(@object.authentication_token).to be_present }
    end
  end

  describe '#generate_authentication_token' do
    before do
      FactoryGirl.create_list(eval(":#{described_class.name.underscore}"),
                              10, authentication_token: Devise.friendly_token)
      @token = token_authenticatable.send(:generate_authentication_token)
    end
    it { expect(@token).to be_present }
    it { expect(described_class.where(authentication_token: @token)).to be_empty }
  end
end
