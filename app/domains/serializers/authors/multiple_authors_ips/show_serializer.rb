module Serializers
  module Authors
    module MultipleAuthorsIps
      class ShowSerializer < ActiveModel::Serializer
        attributes :author_ip, :author_logins
      end
    end
  end
end
