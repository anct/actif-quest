shared_examples 'spam reportable' do
  subject { spam_reportable }
  describe 'associations' do
    it { is_expected.to have_many :spam_reports }
    it { is_expected.to have_many :reporters }
  end
end
