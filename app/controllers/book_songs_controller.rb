class BookSongsController < ApplicationController
  before_action :set_book_song, only: %i[ show update destroy ]
  include Rails.application.routes.url_helpers

  # GET /book_songs
  def index
    @book_songs = BookSong.all

    render json: @book_songs
  end

  # GET /book_songs/1
  def show
    render json: @book_song
  end

  # POST /book_songs
  def create
    @book_song = BookSong.new(
      # Option 1: returns ID of book if already in database
      # Option 2: returns ID of a new book that is created
      book_id: Book.find_by(google_book_extension: params[:google_book_extension]).id,
      song_id: Song.find_by(YT_extension: params[:YT_extension]).id,
      google_book_extension: params[:google_book_extension],
      YT_extension: params[:YT_extension],
    )

    if @book_song.save
      render json: @book_song, status: :created, location: @book_song
    else
      render json: @book_song.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /book_songs/1
  def update
    if @book_song.update(book_song_params)
      render json: @book_song
    else
      render json: @book_song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /book_songs/1
  def destroy
    if @book_song.destroy
      render json: { "message": "successfully destroyed" }
    else
      render json: @book_song.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book_song
    @book_song = BookSong.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_song_params
    # params.fetch(:book_song, {})
    params.require(:book_song).permit(:book_id, :song_id, :google_book_extension, :YT_extension)
  end
end
