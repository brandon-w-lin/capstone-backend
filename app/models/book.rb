class Book < ApplicationRecord
  has_many :booksongs, foreign_key: "book_id", class_name: "BookSong"
  has_many :songs, through: :booksongs
end
