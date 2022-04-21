class Song < ApplicationRecord
  has_many :booksongs, foreign_key: "song_id", class_name: "BookSong"
  has_many :books, through: :booksongs
end
