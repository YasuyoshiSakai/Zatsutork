class AddGenreToWords < ActiveRecord::Migration[6.1]
  def change
    add_column :words, :genre_id, :integer, null: false
    add_index :words, :genre_id
    add_foreign_key :words, :genres
  end
end
