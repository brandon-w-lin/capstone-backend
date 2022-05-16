class Song < ApplicationRecord
  has_many :booksongs, foreign_key: "song_id", class_name: "BookSong"
  has_many :books, through: :booksongs
  validates :url, presence: true
  validates :url, uniqueness: true

  def parse_YT_extension(url)
    start = url.index("v=") + 2
    if url.include? "\u0026"
      length = url.index("\u0026") - start
      url[start, length]
    else
      length = url.length - start
      url[start, length]
    end
  end

  def YTData()
    query = "&id=" + self.YT_extension
    response = HTTP.get("https://youtube.googleapis.com/youtube/v3/videos?part=snippet&key=" + Rails.application.credentials.yt_data_api_key + query)
    return response.parse(:json)
  end

  # def queryYT(options)
  #   query = ""
  #   options.each do |k, v|
  #     unless k == "controller" || k == "action"
  #       query += "&#{k}=#{v}"
  #     end
  #   end
  #   response = HTTP.get("https://youtube.googleapis.com/youtube/v3/videos?part=snippet&key=" + Rails.application.credentials.YT_data_api_key + query)
  #   return response.parse(:json)
  # end
end
