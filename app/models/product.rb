class Product < ApplicationRecord

  has_many :trades, dependent: :destroy
  has_many :offers, through: :trades
  belongs_to :user
  has_one_attached :photo
  validate :expiration_date_cannot_be_in_the_past
  def expiration_date_cannot_be_in_the_past
    if expiration.present? && expiration < 1.month.from_now.to_date
      errors.add(:expiration, "Can't be less than a month from now")
    end
  end

  include PgSearch::Model
  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category, :description, :location ],
    associated_against: {
      user: [ :name, :email, :cpnj ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
