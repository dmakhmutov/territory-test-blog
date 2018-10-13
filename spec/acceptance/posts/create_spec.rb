require 'rspec_api_documentation/dsl'

resource 'Posts' do
  post '/posts' do
    parameter :title, 'Post title', scope: :user, required: true
    parameter :body, 'Post body', scope: :user, required: true
    parameter :login, 'Author login', scope: :user, required: true

    context 'when all params valid' do
      let(:title) { 'some title' }
      let(:body) { 'some body' }
      let(:login) { 'some_login' }

      example_request 'Creating a post' do
        expect(status).to eq(201)
      end
    end

    context 'when some of params invalid' do
      let(:title) { 'some title' }
      let(:body) { 'some body' }
      let(:login) { '' }

      example_request 'Creating a post', document: false do
        expect(status).to eq(422)
      end
    end
  end
end
