test_pw = "wsxedc"
test_accts = []
# Admin test account
test_admin = test_accts.push(User.create!(name: "Test Admin", email: "test.admin@blocipedia.test", password: test_pw, password_confirmation: test_pw, role: :admin))

# Premium test accounts
3.times do
  test_accts.push(
    User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.unique.safe_email,
      password: test_pw,
      password_confirmation: test_pw,
      role: :premium
    )
  )
end

# Standard test accounts
6.times do
  test_accts.push(
    User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.unique.safe_email,
      password: test_pw,
      password_confirmation: test_pw,
      role: :standard
    )
  )
end

# Update accounts to bypass devise confirmation process
test_accts.each do |a|
  a.update_attribute(:confirmed_at, 1.seconds.ago)
end

# Seed with random wikis
15.times do
  Wiki.create!(
    title: Faker::StarWars.unique.planet,
    body: Faker::ChuckNorris.fact,
    user: test_accts.sample
  )
end

puts "Seeded the db with test accounts & wikis."
puts "The # of users is now: #{User.count}"
puts "The # of wikis is now: #{Wiki.count}"
