# Create fake users
#Create Users
100.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end

# Create an admin user
admin = User.new(
  name: 'joel ramsey',
  email: 'joel.d.ramsey@gmail.com',
  password: 'bomb2336'
  )
admin.skip_confirmation!
admin.save!
puts "#{User.count} users created"