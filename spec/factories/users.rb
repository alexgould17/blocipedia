FactoryGirl.define do
  test_password = "wsxedc"
  factory :user do
    sequence(:name) { |n| "Test User #{n}" }
    sequence(:email) { |n| "test.user#{n}@blocipedia.test" }
    password test_password
    password_confirmation test_password
  end
end
