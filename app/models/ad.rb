class Ad < ApplicationRecord

           

  validates :adress,
            presence: true,
            length: { minimum: 5, maximum: 140 }

  validates :title,
            presence: true,
            length: { minimum: 1, maximum: 140 }

  validates :description,
            presence: true,
            length: { minimum: 20, maximum: 1000 }

  validates :zip_code,
            presence: true
          


  validates :phone,
            presence: true


  has_many :participations
  has_many :users, through: :participations
  
end
