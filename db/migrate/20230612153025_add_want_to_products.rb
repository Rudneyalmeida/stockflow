class AddWantToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :want_to_offer, :boolean
  end
end
