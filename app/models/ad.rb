class Ad < ApplicationRecord
  belongs_to :user
  has_many :participations
  has_many :users, through: :participations

  validates :adress,
            presence: true,
            length: { minimum: 5, maximum: 140 }

  validates :title,
            presence: true,
            length: { minimum: 1, maximum: 140 }

  validates :description,
            presence: true,
            length: { minimum: 10, maximum: 1000 }

  validates :zip_code,
            presence: true
          
  validates :phone,
            presence: true

end
