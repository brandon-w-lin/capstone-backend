class Song < ApplicationRecord
  has_many :booksongs
  has_many :books, through: :booksongs
end
