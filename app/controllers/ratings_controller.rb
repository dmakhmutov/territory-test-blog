class RatingsController < ApplicationController
  def create
    form = ::FormObjects::Ratings::Create.call(rating_params)

    if form.success?
      average_rating = Commands::Ratings::Create.new(form.output).call

      render json: average_rating, status: :created
    else
      render json: form.errors, status: :unprocessable_entity
    end

  end

  def rating_params
    params.require(:rating).permit(:post_id, :mark)
  end
end
