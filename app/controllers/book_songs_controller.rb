class BookSongsController < ApplicationController
  before_action :set_book_song, only: %i[ show update destroy ]

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
    @book_song = BookSong.new(book_song_params)

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
    @book_song.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book_song
    @book_song = BookSong.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_song_params
    # params.fetch(:book_song, {})
    params.require(:book_song).permit(:book_id, :song_id)
  end
end
