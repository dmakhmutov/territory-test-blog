module QueryObjects
  module Authors
    class MultipleAuthorsIps
      def initialize(relation = Post.limit(20))
        @relation = relation
      end

      def call
        @relation
          .select('posts.author_ip', '(array_agg(distinct posts.author_login)) as author_logins')
          .group('posts.author_ip')
          .having('count(posts.author_login) > ?', 1)
      end
    end
  end
end
