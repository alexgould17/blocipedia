class Wiki < ApplicationRecord
  belongs_to :user

  # Make public the default
  before_save { self.private ||= false }
end
