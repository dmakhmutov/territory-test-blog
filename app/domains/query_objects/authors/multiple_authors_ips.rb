module QueryObjects
  module Authors
    class MultipleAuthorsIps
      def call
        Post
          .joins(:author)
          .select('posts.author_ip', 'array_agg(authors.login) as author_logins')
          .group('posts.author_ip')
          .having('count(authors.login) > ?', 1)
      end
    end
  end
end
