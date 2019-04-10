class User < ApplicationRecord

    has_many(:listings, dependent: :destroy)
    has_many(:bookings, dependent: :destroy)
    # has_many(:renters, through: :booking, source: :user)


  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :first_name, :last_name, :phone_number, presence: true
end
