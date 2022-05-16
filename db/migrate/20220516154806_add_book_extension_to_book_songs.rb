class AddBookExtensionToBookSongs < ActiveRecord::Migration[7.0]
  def change
    add_column :book_songs, :google_book_extension, :string
  end
end
