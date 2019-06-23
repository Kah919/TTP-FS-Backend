class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :ticker
      t.integer :num_shares
      t.float :curr_price

      t.timestamps
    end
  end
end