class AddGoogleIdToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :googleID, :string
  end
end
