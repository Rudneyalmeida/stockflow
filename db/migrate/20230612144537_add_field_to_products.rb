class AddFieldToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :offered, :boolean, default: false
  end
end
