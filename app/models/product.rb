class Product < ApplicationRecord
  has_many :stocks
  has_many :users, through: :stocks
  has_one_attached :photo
  accepts_nested_attributes_for :stocks
  validate :expiration_date_cannot_be_in_the_past
  def expiration_date_cannot_be_in_the_past
    if expiration.present? && expiration < 1.month.from_now.to_date
      errors.add(:expiration, "Can't be less than a month from now")
    end
  end
end
