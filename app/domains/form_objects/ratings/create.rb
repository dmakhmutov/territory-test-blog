module FormObjects
  module Ratings
    Create = Dry::Validation.Schema do
      configure do
        config.type_specs = true

        def post_present?(post_id)
          Post.exists?(id: post_id)
        end
      end

      required(:post_id, :integer).filled(:post_present?)
      required(:mark, :integer).filled(inclusion?: ('1'..'5').to_a)
    end
  end
end
