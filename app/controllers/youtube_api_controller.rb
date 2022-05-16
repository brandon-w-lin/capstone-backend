class YoutubeApiController < ApplicationController

  # Need to be able to:
  # - search by title
  # - filter results by category = music (category ID = 10)
  # - retrieve list data about multiple videos

  # GET /songs/search

  # GET /songs?id=[YTExtension]
  def show
    # render json: @song.queryYT(params)
    query = ""
    params.each do |k, v|
      unless k == "controller" || k == "action"
        query += "&#{k}=#{v}"
      end
    end

    response = HTTP.get("https://youtube.googleapis.com/youtube/v3/videos?part=snippet&key=" + Rails.application.credentials.yt_data_api_key + query)
    render json: response.parse(:json)
  end

  # def show
  #   id = params[:id]
  #   render json: { message: "the id is #{id}" }
  # end

  # GET /songs/multiple IDs
end
