class CreateWordGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :word_genres do |t|
      t.integer :word_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
