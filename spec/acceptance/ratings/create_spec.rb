require 'rspec_api_documentation/dsl'

resource 'Ratings' do
  post '/ratings' do
    parameter :post_id, 'Post id', scope: :rating, required: true
    parameter :mark, 'Post rating mark', scope: :rating, required: true

    let(:post) { create(:post) }
    let(:post_id) { post.id }
    let(:mark) { '3' }

    example_request 'Create a rating' do
      expect(response_body.to_i).to eq(mark.to_f)
      expect(status).to eq(201)
    end
  end
end
