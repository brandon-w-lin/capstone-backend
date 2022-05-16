class SimplifySongs < ActiveRecord::Migration[7.0]
  def change
    remove_column :songs, :title
    remove_column :songs, :artist
    remove_column :songs, :album
    remove_column :songs, :genre
    remove_column :songs, :year
  end
end
