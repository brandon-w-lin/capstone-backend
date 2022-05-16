class RemoveGoogleIdFromBookSongs < ActiveRecord::Migration[7.0]
  def change
    remove_column :book_songs, :googleID
  end
end
