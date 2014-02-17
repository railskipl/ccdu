# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "creating admin"
admin = User.create(:email => 'admin@gmail.com', :username => 'admin', :password => 'admin123!')
admin.add_role "admin"

puts "creating Roles"
Role.create(:name => "admin")
Role.create(:name => "zone")
Role.create(:name => "district")
Role.create(:name => "block")
Role.create(:name => "vendor")