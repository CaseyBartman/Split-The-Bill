class User < ApplicationRecord
  has_many :contributions, dependent: :destroy
  has_many :expenses, through: :contributions
  has_many :participants, dependent: :destroy
  has_many :trips, through: :participants

  # Include default Devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
end
