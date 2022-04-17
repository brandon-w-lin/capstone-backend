class Book < ApplicationRecord
  has_many :bookssongs, foreign_key: "book_id", class_name: "BookSong"
  has_many :songs, through: :bookssongs
end
