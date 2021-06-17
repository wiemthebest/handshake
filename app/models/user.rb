class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  validates :encrypted_password,
            presence: true,
            length: { minimum: 6 }

    validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/,
              message: 'email adress please'
            }
     
  has_many :participations
  has_many :ads, through: :participations



end
