require 'resolv'

module FormObjects
  module Posts
    Create = Dry::Validation.Schema do
      configure do
        def author_ip_format_valid?(ip)
          !Resolv::AddressRegex.match(ip).nil?
        end
      end

      required(:title).filled(:str?)
      required(:body).filled(:str?)
      required(:author_ip).filled(:str?, :author_ip_format_valid?)
      required(:login).filled(:str?)
    end
  end
end
