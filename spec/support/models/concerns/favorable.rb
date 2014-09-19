shared_examples 'favorable' do
  subject { favorable }
  describe 'associations' do
    it { is_expected.to have_many :favorites }
    it { is_expected.to have_many :favored_users }
  end
end
