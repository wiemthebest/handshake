class Ad < ApplicationRecord




  belongs_to :user 
  has_many :participations
  has_many :users, through: :participations
  has_one_attached :cover, dependent: :destroy




end
