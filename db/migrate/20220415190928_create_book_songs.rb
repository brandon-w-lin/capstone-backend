class CreateBookSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :book_songs do |t|
      t.integer :book_id
      t.integer :song_id

      t.timestamps
    end
  end
end
