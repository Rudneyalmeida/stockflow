class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :transaction
  belongs_to :stock
end
