class Book < ApplicationRecord
  has_many :booksongs
  has_many :songs, through: :booksongs
end
