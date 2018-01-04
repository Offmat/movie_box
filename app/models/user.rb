class User < ApplicationRecord
  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password, message: "Password should be same"
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :opinions

  def self.authentication(email, password)
    user = User.find_by(email: email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
