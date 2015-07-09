# Create an admin user
admin = User.new(
  name: 'joel ramsey',
  email: 'joel.d.ramsey@gmail.com',
  password: 'bomb2336'
  )
admin.skip_confirmation!
admin.save!
puts "#{User.count} users created"