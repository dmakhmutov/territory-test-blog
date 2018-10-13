class PostsTopsController < ApplicationController
  def show
    posts = ::QueryObjects::Posts::Top.new(records_count).call

    render json: posts
  end

  private

  def records_count
    permited_params.presence || 10
  end

  def permited_params
    params.permit(:count)
  end
end
