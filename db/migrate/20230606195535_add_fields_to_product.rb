class AddFieldsToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :user, null: false, foreign_key: true
    add_column :products, :category, :string
    add_column :products, :quantity, :integer
    add_column :products, :expiration, :date
    add_column :products, :location, :string
  end
end
