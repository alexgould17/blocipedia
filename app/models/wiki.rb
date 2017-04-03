class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  # Make public the default
  before_save { self.private ||= false }
end
