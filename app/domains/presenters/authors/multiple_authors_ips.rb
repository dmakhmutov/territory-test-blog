module Presenters
  module Authors
    class MultipleAuthorsIps
      def initialize(ips)
        @ips = ips
      end

      def ips_with_author_array
        @ips.inject([]) { |array, ip_address| array << [ip_address.author_ip, ip_address.author_logins] }
      end
    end
  end
end
