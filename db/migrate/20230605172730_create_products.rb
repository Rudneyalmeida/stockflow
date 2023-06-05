class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :category
      t.string :name
      t.text :description
      t.date :expiration
      t.string :location

      t.timestamps
    end
  end
end
