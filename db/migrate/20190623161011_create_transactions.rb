class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :stock_id
      t.integer :num_share

      t.timestamps
    end
  end
end
