describe ::Commands::Ratings::Create do
  let(:params) do
    {
      post_id: post.id,
      mark: mark,
    }
  end
  let(:post) { create(:post) }
  let(:mark) { 3 }

  describe '#call' do
    subject(:command) { described_class.new(params) }

    it 'creates a new rating and update average_rating' do
      expect { command.call }.to change(::Rating, :count).by(1)
      expect(post.reload.average_rating).to eq mark
    end
  end
end
