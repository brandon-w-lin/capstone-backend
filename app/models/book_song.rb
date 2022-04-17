class BookSong < ApplicationRecord
  belongs_to :book, class_name: "Book"
  belongs_to :song, class_name: "Song"
end
