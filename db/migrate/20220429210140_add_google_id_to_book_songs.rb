class AddGoogleIdToBookSongs < ActiveRecord::Migration[7.0]
  def change
    add_column :book_songs, :googleID, :string
  end
end
