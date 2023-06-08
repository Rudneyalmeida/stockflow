class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :trades, dependent: :destroy
  has_many :products, through: :trades

  enum status: { pending: 1, accepted: 2, rejected: 3 }
end
