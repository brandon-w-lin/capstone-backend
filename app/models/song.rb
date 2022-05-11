class Song < ApplicationRecord
  has_many :booksongs, foreign_key: "song_id", class_name: "BookSong"
  has_many :books, through: :booksongs

  def parseYTExtension(url)
    start = url.index("v=") + 2
    if url.include? "\u0026"
      length = url.index("\u0026") - start
      url[start, length]
      # url[url.index("v=") + 3, url.index("\u0026") - url.index("v=") - 3]
    else
      length = url.length - start
      url[start, length]

      # url[url.index("v=") + 3, url.length url.index("v=") - 3]
    end
    # url.include? "\u0026"
  end
end
