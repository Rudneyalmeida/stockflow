class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.boolean :valid

      t.timestamps
    end
  end
end
