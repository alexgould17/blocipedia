class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_save do
    self.email.downcase!
    self.role ||= :standard
  end

  enum role: [:standard, :premium, :admin]
end
