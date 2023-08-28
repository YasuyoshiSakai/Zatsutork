class CreateWordComments < ActiveRecord::Migration[6.1]
  def change
    create_table :word_comments do |t|
      t.text :comment
      t.references :customer, foreign_key: true # カラム名を customer_id に変更
      t.integer :word_id

      t.timestamps
    end
  end
end
