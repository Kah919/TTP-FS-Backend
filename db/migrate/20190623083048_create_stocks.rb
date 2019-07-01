class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :ticker
      t.float :open_price

      t.timestamps
    end
  end
end
