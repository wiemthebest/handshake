class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  geocoded_by :full_address
  after_validation :geocode
  before_save :geocode
  after_create :welcome_send, :geocode


 has_one_attached :avatar
         


  def welcome_send
  UserMailer.welcome_email(self).deliver_now
  end

  def name
    return self.first_name + ' ' + self.last_name
  end

  def full_address
    [address, city, zip_code, "france"].compact.join(', ')
  end      

  scope :admin, -> {where(admin: true)}

end
