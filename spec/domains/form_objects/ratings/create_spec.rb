describe ::FormObjects::Ratings::Create do
  subject(:form) { described_class.call(attributes) }

  let(:post_id) { create(:post).id }
  let(:base_attributes) do
    {
      post_id: post_id,
      mark: '2'
    }
  end

  context 'when success' do
    let(:attributes) { base_attributes }

    it { is_expected.to be_success }
  end
end
