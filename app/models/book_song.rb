class BookSong < ApplicationRecord
  belongs_to :book, class_name: "Book"
  belongs_to :song, class_name: "Song"

  find_book_id(google_book_extension)
    puts "test"
  end
end
