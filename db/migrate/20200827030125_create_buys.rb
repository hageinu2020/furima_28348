class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.string :code,	null: false
      t.integer :pref, null: false
      t.string :city,	null: false
      t.string :address,	null: false
      t.string :building		
      t.string :tel,	null: false
      t.references :buys_dates,	null: false, foreign_key: true
      t.timestamps
    end
  end
end
