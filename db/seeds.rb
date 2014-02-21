# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "creating Roles"
Role.create(:name => "admin", :display_name => "Admin")
Role.create(:name => "zone", :display_name => "Zonal Level Manager")
Role.create(:name => "district", :display_name => "District Level Manager")
Role.create(:name => "block", :display_name => "Block Level Manager")
Role.create(:name => "mobile", :display_name => "Mobile Surveyor")
puts "creating admin"
admin = User.create({:email=> 'admin@example.com',:username => 'admin', :password => 'admin123!'})
admin.roles = [Role.first]
admin.save

