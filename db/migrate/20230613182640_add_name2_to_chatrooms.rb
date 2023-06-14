class AddName2ToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :name2, :string
  end
end
