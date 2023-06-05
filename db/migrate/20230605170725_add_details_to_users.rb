class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :cpnj, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
  end
end
