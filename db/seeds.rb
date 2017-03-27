test_pw = "wsxedc"
test_accts = []
# Admin test account
test_admin = test_accts.push(User.create(name: "Test Admin", email: "test.admin@blocipedia.test", password: test_pw, password_confirmation: test_pw, role: :admin))

# Premium test accounts
test_prem1 = test_accts.push(User.create(name: "Test Premium User #1", email: "test.premium1@blocipedia.test", password: test_pw, password_confirmation: test_pw, role: :premium))
test_prem2 = test_accts.push(User.create(name: "Test Premium User #2", email: "test.premium2@blocipedia.test", password: test_pw, password_confirmation: test_pw, role: :premium))

# Standard test accounts
test_standard1 = test_accts.push(User.create(name: "Test Standard User #1", email: "test.standard1@blocipedia.test", password: test_pw, password_confirmation: test_pw, role: :standard))
test_standard2 = test_accts.push(User.create(name: "Test Standard User #2", email: "test.standard2@blocipedia.test", password: test_pw, password_confirmation: test_pw, role: :standard))
test_standard3 = test_accts.push(User.create(name: "Test Standard User #3", email: "test.standard3@blocipedia.test", password: test_pw, password_confirmation: test_pw, role: :standard))

# Update accounts to bypass devise confirmation process
test_accts.each do |a|
  a.update_attribute(:confirmed_at, 1.seconds.ago)
end

puts "Seeded the db with test accounts. The # of users is now: #{User.count}"
