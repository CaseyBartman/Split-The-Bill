class User < ApplicationRecord
  has_many :contributions, dependent: :destroy
  has_many :expenses, through: :contributions
  has_many :participants, dependent: :destroy
  has_many :trips, through: :participants
end
