class User < ActiveRecord::Base
  before_save :email_downcase
  validates :name, presence: true, length: { maximum: 50 }
  mount_uploader :avatar, AvatarUploader
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 250}, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false 
  }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
  # Converts email via downcase
  def email_downcase
    self.email = email.downcase
  end
end
