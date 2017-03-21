class User < ApplicationRecord
  # Save emails as lowercase
  before_save { self.email = email.downcase if email.present? }

  # Validate data fields
  # The first password validation runs if no password has been set (user creation). Otherwise second.
  validates :name, presence: true, length: { minimum: 1, maximum: 30 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6, maximum: 20 }, if: "password_digest.nil?"
  validates :password, presence: true, length: { minimum: 6, maximum: 20 }, allow_blank: true

  # Use BCrypt to store password securely
  has_secure_password
end
