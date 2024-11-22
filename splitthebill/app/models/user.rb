class User < ApplicationRecord
  has_many :contributions, dependent: :destroy
  has_many :expenses, through: :contributions
end
