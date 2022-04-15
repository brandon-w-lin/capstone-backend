class BookSong < ApplicationRecord
  belongs_to :book, :song
end
