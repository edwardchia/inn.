class Listing < ApplicationRecord
  has_many(:bookings)
  has_many(:bookers, through: :bookings, source: :user)
  belongs_to(:owner, class_name: "User", foreign_key: "user_id")

  validates :price, numericality: { only_integer: true }
  validates :address, presence: true
  validates :amenities, :description, presence: true
end
