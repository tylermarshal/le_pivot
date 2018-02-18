class Api::V1::SearchController < ApplicationController

  def index
    developer = Developer.find_by(api_key: search_params[:api_key])
    if developer.nil?
      render file: '/public/404', status: 404
    else
      render json: SearchService.new(search_params), serializer: SearchSerializer
    end
  end

  private

    def search_params
      params.permit(:q, :api_key, :type)
    end

end
