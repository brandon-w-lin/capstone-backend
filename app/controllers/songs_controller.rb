class SongsController < ApplicationController
  before_action :set_song, only: %i[ show update destroy ]

  # GET /songs
  def index
    # NOTE: opportunity for performance improvement here...the query runs pretty slow because it is doing an individual query to the youtube API for every song. Some options:
    # - store the returned data in my database (how would we handle if data in the API changes?)
    # - batch the queries (could we set it up to only batch for a size n=10, or some other limited number set by pagination?)

    @songs = Song.all

    # updated to use view template
    # render json: @songs
    render :index
  end

  # GET /songs/query?[query params]
  def search
    query = ""
    params.each do |k, v|
      unless k == "controller" || k == "action"
        query += "&#{k}=#{v.split(" ").join("%20")}"
      end
    end
    # response = HTTP.get("https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&key=" + Rails.application.credentials.yt_data_api_key + "&q=potter")
    # render json: { query: query }
    response = HTTP.get("https://youtube.googleapis.com/youtube/v3/search?part=snippet&key=" + Rails.application.credentials.yt_data_api_key + query)
    render json: response.parse(:json)
    # render json: { message: Rails.application.credentials.yt_data_api_key }
  end

  # GET /songs/1
  def show
    # updated to use view template
    # render json: @song
    render :show
  end

  # POST /songs
  def create
    @song = Song.new(song_params)
    @song.YT_extension = @song.parse_YT_extension(@song.url)

    if @song.save
      render json: @song, status: :created, location: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /songs/1
  def update
    if @song.update(song_params)
      @song.YT_extension = @song.parse_YT_extension(@song.url)
      @song.save
      render json: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /songs/1
  def destroy
    if @song.destroy
      render json: { "message": "successfully destroyed" }
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_song
    # @song = Song.find(params[:YT_extension])
    @song = Song.find_by(YT_extension: params[:YT_extension])
  end

  # Only allow a list of trusted parameters through.
  def song_params
    # params.fetch(:song, {})
    params.require(:song).permit(:url, :YT_extension)
  end
end
