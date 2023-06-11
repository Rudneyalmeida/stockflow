class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :offers_received, through: :products, source: :offers
  has_one_attached :photo
  has_many :notifications

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
