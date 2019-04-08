class User < ApplicationRecord
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :first_name, :last_name, :phone_number, presence: true
end
