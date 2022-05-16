class RenameBookId < ActiveRecord::Migration[7.0]
  def up
    rename_column :books, :googleID, :google_book_extension
  end

  def down
    rename_column :books, :google_book_extension, :googleID
  end
end
