class Song < ApplicationRecord
  has_many :booksongs, foreign_key: "song_id", class_name: "BookSong"
  has_many :books, through: :booksongs
  validates :YT_extension, presence: true
  validates :YT_extension, uniqueness: true

  def YTData()
    query = "&id=" + self.YT_extension
    response = HTTP.get("https://youtube.googleapis.com/youtube/v3/videos?part=snippet&key=" + Rails.application.credentials.yt_data_api_key + query)
    return response.parse(:json)
  end
end
