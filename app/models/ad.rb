class Ad < ApplicationRecord
  validates :date,  presence: true

  validates :title, presence: true,  length: { minimum: 5, maximum: 140 }


  validates :description,  presence: true, length: { minimum: 5, maximum: 1000 }

  validates :zip_code, presence: true,
            format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: 'please enter a valid french zip code' },
            uniqueness: true


  validates :adress, presence: true, length: { minimum: 20, maximum: 1000 }

  validates :phone, presence: true,
            format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/,
                      message: 'please enter a valid french number' }


  


  belongs_to :user 
  has_many :participations
  has_one_attached :cover, dependent: :destroy




end
