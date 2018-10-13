class AuthorMultipleIpsController < ApplicationController
  def show
    ips = ::QueryObjects::Authors::MultipleAuthorsIps.new.call
    ips_with_author = ::Presenters::Authors::MultipleAuthorsIps.new(ips).ips_with_author_array

    render json: ips_with_author
  end
end
