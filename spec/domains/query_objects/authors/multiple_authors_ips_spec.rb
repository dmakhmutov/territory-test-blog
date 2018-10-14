describe ::QueryObjects::Authors::MultipleAuthorsIps do
  describe '#call' do
    subject(:query) { described_class.new.call }

    let(:author) { create(:author) }
    let(:author_ip) { '1.1.1.1' }

    before do
      create(:post, author_login: author.login, author_ip: author_ip)
      create(:post, author_login: author.login, author_ip: author_ip)
    end

    it { is_expected.not_to be_empty }
    it { is_expected.to be_kind_of(ActiveRecord::Relation) }

    describe '#first' do
      subject { query.reload.first }

      its(:author_ip) { is_expected.to eq author_ip }
      its(:author_logins) { is_expected.to eq [author.login] }
    end
  end
end
