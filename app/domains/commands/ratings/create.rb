module Commands
  module Ratings
    class Create
      def initialize(params)
        @post_id = params.fetch(:post_id)
        @mark = params.fetch(:mark)
      end

      def call
        Rating.transaction do
          post = find_post
          add_new_rating(post)
          average_rating = find_average_rating(post)
          update_average_rating(post, average_rating)
          average_rating
        rescue ActiveRecord::StaleObjectError
          retry
        end
      end

      private

      def find_post
        Post.find(@post_id)
      end

      def add_new_rating(post)
        Rating.create!(post: post, mark: @mark)
      end

      def find_average_rating(post)
        Rating.where(post_id: post.id).average(:mark).to_f
      end

      def update_average_rating(post, average_rating)
        post.update!(average_rating: average_rating)
      end
    end
  end
end
