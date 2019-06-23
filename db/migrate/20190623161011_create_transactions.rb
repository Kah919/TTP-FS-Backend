class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :used_id
      t.integer :stock_id

      t.timestamps
    end
  end
end
