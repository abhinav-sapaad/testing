class User < ApplicationRecord
  validates :email, presence: true
  validates :address, presence: true
end
