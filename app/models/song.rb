class Song < ApplicationRecord
  has_many :bookssongs, foreign_key: "song_id", class_name: "BookSong"
  has_many :books, through: :bookssongs
end
