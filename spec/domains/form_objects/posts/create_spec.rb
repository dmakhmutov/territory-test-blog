describe ::FormObjects::Posts::Create do
  subject(:form) { described_class.call(attributes) }

  let(:base_attributes) do
    {
      user: {
        title: 'some title',
        body: 'some body',
        author_ip: '1.1.1.1',
        login: 'some login'
      }
    }
  end

  context 'when success' do
    let(:attributes) { base_attributes }

    it { is_expected.to be_success }
  end

  context 'when user params empty' do
    let(:attributes) do
      { user: {} }
    end

    it { is_expected.not_to be_success }
  end

  context 'when author_ip invalid format' do
    let(:attributes) do
      base_attributes[:user].merge(author_ip: 'wrong_format_ip')
    end

    it { is_expected.not_to be_success }
  end
end
