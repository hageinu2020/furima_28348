class CreateBuysDates < ActiveRecord::Migration[6.0]
  def change
    create_table :buys_dates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sales, null: false, foreign_key: true
      t.timestamps
    end
  end
end
