class SimplifyBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :isbn
    remove_column :books, :title
    remove_column :books, :summary
    remove_column :books, :author
    remove_column :books, :publisher
    remove_column :books, :cover_image_url
    remove_column :books, :genre
    remove_column :books, :year
  end
end
