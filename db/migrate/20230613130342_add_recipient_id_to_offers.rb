class AddRecipientIdToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :recipient_id, :integer
  end
end
