class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.string :text, null: false
      # t.string :pic, null: false
      t.string :name, null: false
      t.integer :price , null: false
      t.integer :genre_id, null: false
      t.integer :status_id, null: false
      t.integer :area_id, null: false
      t.integer :day_id, null: false
      t.integer :fee_id, null: false
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
