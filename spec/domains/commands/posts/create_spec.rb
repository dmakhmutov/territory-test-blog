describe ::Commands::Posts::Create do
  let(:params) do
    {
      title: 'some title',
      body: 'some body',
      author_ip: '1.1.1.1',
      login: 'some login'
    }
  end

  describe '#call' do
    subject(:command) { described_class.new(params) }

    context 'when new author login' do
      it 'creates a new post and author' do
        expect { command.call }
          .to change(::Post, :count).by(1)
          .and change(::Author, :count).by(1)
      end
    end

    context 'when author exists' do
      before { create(:author, login: 'some login') }

      it 'creates a new post' do
        expect { command.call }
          .to change(::Post, :count).by(1)
          .and change(::Author, :count).by(0)
      end
    end
  end
end
