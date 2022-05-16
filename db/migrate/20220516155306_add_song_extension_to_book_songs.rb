class AddSongExtensionToBookSongs < ActiveRecord::Migration[7.0]
  def change
    add_column :book_songs, :YT_extension, :string
  end
end
