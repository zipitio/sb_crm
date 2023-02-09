class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	before_save { self.email = email.downcase }
    has_many :clients
    validates :username, presence: true, 
        uniqueness: { case_sensitive: false}, 
        length: {minimum: 3, maximum: 25}
    validates :email, presence: true, 
        uniqueness: { case_sensitive: false}, 
        length: { maximum: 105},
        format: { with: URI::MailTo::EMAIL_REGEXP}
end