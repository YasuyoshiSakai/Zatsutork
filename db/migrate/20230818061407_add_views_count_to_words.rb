class AddViewsCountToWords < ActiveRecord::Migration[6.1]
  def change
    add_column :words, :views_count, :integer, default: 0
  end
end
