Factory.define(:user) do |u|
  u.sequence(:email) { |n| "user#{n}@example.com" }
  u.password 'test'
  u.phone '555-555-5555'
end
