class AddWordIdToImages < ActiveRecord::Migration[6.1]
  def change
    add_reference :images, :word, null: false, foreign_key: true
  end
end
