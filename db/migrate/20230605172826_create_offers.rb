class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :transaction, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.integer :amount
      t.text :message

      t.timestamps
    end
  end
end
