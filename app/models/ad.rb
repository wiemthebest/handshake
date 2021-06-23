include UsersHelper
class Ad < ApplicationRecord
  
  belongs_to :user
  has_many :participations
  has_many :users, through: :participations
  geocoded_by :full_address
  after_validation :geocode
  after_create :geocode

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

 def full_address
   [adress, city, zip_code, "france"].compact.join(', ')
 end 
 
end
