require 'rspec_api_documentation/dsl'

resource 'Posts top' do
  get '/posts_top' do
    parameter :count, 'Post count'

    let!(:post_1) { create(:post, average_rating: 4) }
    let!(:post_2) { create(:post, average_rating: 3) }
    let(:expected_attributes) { %w[id title body author_id average_rating]  }

    example_request 'Get posts rating' do
      expect(status).to eq(200)
      expect(response_body).to include_json(
        [
          post_1.attributes.slice(*expected_attributes),
          post_2.attributes.slice(*expected_attributes)
        ]
      )
    end
  end
end
