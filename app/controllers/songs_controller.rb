class SongsController < ApplicationController
  before_action :set_song, only: %i[ show update destroy ]

  # GET /songs
  def index
    @songs = Song.all

    render json: @songs
  end

  # GET /songs/query/[query params]
  def search
    query = ""
    params.each do |k, v|
      unless k == "controller" || k == "action"
        query += "&#{k}=#{v}"
      end
    end
    response = HTTP.get("https://youtube.googleapis.com/youtube/v3/videos?part=snippet&key=" + Rails.application.credentials.yt_data_api_key + query)
    render json: response.parse(:json)
    # render json: { message: Rails.application.credentials.yt_data_api_key }
  end

  # GET /songs/1
  def show
    # @song.YTResponse = @song.queryYT
    render json: @song
  end

  # POST /songs
  def create
    @song = Song.new(song_params)
    @song.YTExtension = @song.parseYTExtension(@song.url)

    if @song.save
      render json: @song, status: :created, location: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /songs/1
  def update
    if @song.update(song_params)
      @song.YTExtension = @song.parseYTExtension(@song.url)
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
    # @song = Song.find(params[:YTExtension])
    @song = Song.find_by(YTExtension: params[:YTExtension])
  end

  # Only allow a list of trusted parameters through.
  def song_params
    # params.fetch(:song, {})
    params.require(:song).permit(:url, :YTExtension, :title, :artist, :album, :genre, :year)
  end
end
