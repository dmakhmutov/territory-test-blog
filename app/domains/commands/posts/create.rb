module Commands
  module Posts
    class Create
      POST_PARAMS = %i[title body author_ip].freeze

      def initialize(params)
        @login = params.fetch(:login)
        @post_params = params.slice(*POST_PARAMS).symbolize_keys
      end

      def call
        Post.transaction do
          author = find_or_create_author
          create_post(author)
        end
      end

      private

      def find_or_create_author
        Author.find_or_create_by(login: @login)
      end

      def create_post(author)
        Post.create!(author: author, **@post_params)
      end
    end
  end
end
