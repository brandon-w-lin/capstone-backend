class AddYtExtensionToSongs < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :YTExtension, :string
  end
end
