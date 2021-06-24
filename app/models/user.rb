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
  
  def friends
    friends = Message.where(sender: self).map { |message| message.receiver} + Message.where(receiver: self).map { |message| message.sender}
    friends.uniq
  end

  def conversation_with(friend_id)
    friend       = User.find(friend_id)
    conversation = Message.where(sender: self, receiver: friend) + Message.where(sender: friend, receiver: self)
    conversation.sort_by { |message| message.created_at }
  end  

end
