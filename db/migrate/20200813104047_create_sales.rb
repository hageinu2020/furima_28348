class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.string :text
      t.string :pic
      t.string :name
      t.integer :price 
      t.integer :genre
      t.integer :status
      t.integer :area
      t.integer :process
      t.integer :fee
      t.string :user
      t.timestamps
    end
  end
end
