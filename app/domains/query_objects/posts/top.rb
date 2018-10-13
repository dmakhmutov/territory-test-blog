module QueryObjects
  module Posts
    class Top
      def initialize(number)
        @number = number
      end

      def call
        Post.order(average_rating: :desc).limit(@number)
      end
    end
  end
end
