class User < ApplicationRecord
  has_many :expenses
  has_many :expenses, dependent: :destroy

  has_secure_password
end
