class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :start_date, :end_date, presence: true
  # validates :payment_info, presence: true
end
