class PostsController < ApplicationController
  def create
    form = ::FormObjects::Posts::Create.call(post_params)

    if form.success?
      post = Commands::Posts::Create.new(form.output[:user]).call

      render json: post, status: :created
    else
      render json: form.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.permit!.to_h.tap do |param|
      param[:user].merge!(author_ip: request.remote_ip)
    end
  end
end
