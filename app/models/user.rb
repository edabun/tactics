class User < ApplicationRecord
  before_save { email.downcase! }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 15 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@gbox.adnu.edu.ph\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } 
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
