class PostsController < ApplicationController
  def create
    form = ::FormObjects::Posts::Create.call(post_params)

    if form.success?
      post = Commands::Posts::Create.new(form.output).call

      render json: post, status: :created
    else
      render json: form.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params
      .require(:user)
      .permit(
        :title,
        :body,
        :login
      ).to_h.tap do |param|
        param.merge!(author_ip: request.remote_ip)
      end
  end
end
