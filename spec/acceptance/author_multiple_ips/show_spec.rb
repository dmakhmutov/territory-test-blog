require 'rspec_api_documentation/dsl'

resource 'Author multiple ips' do
  get '/author_multiple_ips' do
    context 'when no auhtors' do
      example_request 'Show empty array' do
        expect(response_body).to eq('[]')
        expect(status).to eq(200)
      end
    end

    context 'when auhtors with posts present' do
      let(:author) { create(:author) }
      let(:author_ip) { '1.1.1.1' }

      before do
        create(:post, author_login: author.login, author_ip: author_ip)
        create(:post, author_login: author.login, author_ip: author_ip)
      end

      example_request 'Get auhtor multiple ips array' do
        expect(status).to eq(200)
        expect(response_body).to include_json(
          [
            {
              author_ip: author_ip,
              author_logins: [author.login]
            }
          ]
        )
      end
    end
  end
end
