class AuthorMultipleIpsController < ApplicationController
  def show
    ips = ::QueryObjects::Authors::MultipleAuthorsIps.new.call

    render json: ips, each_serializer: ::Serializers::Authors::MultipleAuthorsIps::ShowSerializer
  end
end
