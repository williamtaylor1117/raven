# Create an admin user
admin = User.new(
  name: 'joel ramsey',
  email: 'joel.d.ramsey@gmail.com',
  password: 'password'
  )
admin.skip_confirmation!
admin.save!

guest = User.new(
  name: 'guest',
  email: 'guest@raven.com',
  password: 'password'
  )
guest.skip_confirmation!
guest.save!
puts "#{User.count} users created"