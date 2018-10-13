describe ::QueryObjects::Posts::Top do
  subject { described_class.new(recourds_count).call }

  describe '#call' do
    let(:recourds_count) { 2 }
    let(:expeceted_result) { [post_1, post_2] }

    let!(:post_1) { create(:post, average_rating: 4) }
    let!(:post_2) { create(:post, average_rating: 3) }
    let!(:post_3) { create(:post, average_rating: 2) }

    it { is_expected.to eq expeceted_result }
  end
end
