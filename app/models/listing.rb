class Listing < ApplicationRecord
  has_many(:bookings)
  has_many(:bookers, through: :bookings, source: :user)
  belongs_to(:owner, class_name: "User", foreign_key: "user_id")
end
