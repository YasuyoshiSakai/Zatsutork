class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.string :title
      t.text :content
      t.integer :score
      t.integer :rating
      t.references :customer, null: false, foreign_key: false

      t.timestamps
    end
  end
end