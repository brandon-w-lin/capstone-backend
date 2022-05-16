class RenameSongId < ActiveRecord::Migration[7.0]
  def up
    rename_column :songs, :YTExtension, :YT_extension
  end

  def down
    rename_column :songs, :YT_extension, :YTExtension
  end
end
