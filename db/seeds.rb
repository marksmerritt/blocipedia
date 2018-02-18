require 'faker'

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


100.times do 
  Wiki.create!(
    title: Faker::FamilyGuy.quote,
    body: Faker::FamilyGuy.quote,
    private: false,
    user: users.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"