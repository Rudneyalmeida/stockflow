class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :trades, dependent: :destroy
end
