require 'faker'

# Create Users
20.times do 
  user = User.new(
    name: Faker::GameOfThrones.character,
    email: Faker::Internet.email,
    password: 'helloworld'
  )
  user.skip_confirmation!
  user.save!
end

users = User.all

# Create Wikis
100.times do 
  Wiki.create!(
    title: Faker::FamilyGuy.quote,
    body: Faker::FamilyGuy.quote,
    private: false,
    user: users.sample
  )
end

# Create Users with Different Roles
admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)
admin.skip_confirmation!
admin.save!

standard = User.new(
  name: 'Standard User',
  email: 'standard@example.com',
  password: 'helloworld',
  role: 'standard'
)
standard.skip_confirmation!
standard.save!

premium = User.new(
  name: 'Premium User',
  email: 'premium@example.com',
  password: 'helloworld',
  role: 'premium'
)
premium.skip_confirmation!
premium.save!


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"