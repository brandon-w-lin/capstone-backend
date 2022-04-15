class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.integer :booksong_id
      t.string :isbn
      t.string :title
      t.text :summary
      t.string :author
      t.string :publisher
      t.string :cover_image_url
      t.string :genre
      t.integer :year

      t.timestamps
    end
  end
end
