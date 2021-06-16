class Ad < ApplicationRecord
validates :type,
    presence: true,
    length: { maximum: 50 }

 validates :category,
    presence: true,
    uniqueness: true,
    length: { maximum: 70 }

validates :title,
    presence: true,
    length: { maximum: 50 }
    
 
  validates :description,
    presence: true,
    length: { minimum:100, maximum: 10000 }

  
  validates :adress,
    presence: true,
    length: { minimum: 5, maximum: 50 }
    
    validate :date_validation 

    validates :zip_code,
    presence: true,
    length: { maximum: 20 } 

     validates :phone,
    presence: true,
    numericality: true,
    length: { minimum: 8, maximum: 15 }


  belongs_to :user 
  has_many :participations
  has_many :users, through: :participations
  has_one_attached :cover, dependent: :destroy


  def date_validation
    if self[:end_date] < self[:start_date]
      errors[:end_date] << "La date de fin doit être après la date de début"
      return false
    else
      return true
    end
  end


end
