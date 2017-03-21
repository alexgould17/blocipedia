require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  # Test for name presence, length & validity (tbd)
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }

  # Test for email presence, uniqueness & validity (tbd) of email
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }

  # Test for password presence, length & security
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "should set user & email attributes" do
      expect(user).to have_attributes(name: user.name, email: user.email)
    end
  end
end
