# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# puts "creating Roles"
# Role.create(:name => "admin", :display_name => "Admin")
# Role.create(:name => "zone", :display_name => "Zonal Level Manager")
# Role.create(:name => "district", :display_name => "District Level Manager")
# Role.create(:name => "block", :display_name => "Block Level Manager")
# Role.create(:name => "mobile", :display_name => "Mobile Surveyor")
# puts "creating admin"
# admin = User.create({:email=> 'admin@example.com',:username => 'admin', :password => 'admin123!'})
# admin.roles = [Role.first]
# admin.save
    
      #puts "creating Zone"
    # @a = ["BIKANER","JODHPUR"]

    # @a.each do |f|
    # 	Admin::Zone.create(:zone_name => f)
    # end
      
      #puts "creating District for zone JODHPUR"
    # @b = ["JODHPUR"]

    # @b.each do |f|
    # 	@zone = Admin::Zone.find_by_zone_name("JODHPUR")
    # 	Admin::District.create(:district_name => f,:zone_id => @zone.id, :code => "J",:lab_name => "",:lab_present => "No")
    # end
      
      #puts "creating block for district JODHPUR"
    # @c = ["Bap",
    #        "Baleser",
    #        "Bhopalghar",
    #        "Bilara",
    #        "Mandor",
    #        "Osian",
    #        "Phlodi",
    #        "Sherghar"]
    
    # @c.each do |f|
    # 	@district = Admin::District.find_by_district_name("JODHPUR")
    # 	Admin::Block.create(:block_name => f, :district_id => @district.id, :code => "", :lab_name => "", :laboratory_present => "No")
    # end
      #puts "creating district for zone bikaner"
    # @bikaner = ["BIKANER"]

    # @bikaner.each do |f|
    #   @zone = Admin::Zone.find_by_zone_name("BIKANER")
    #   Admin::District.create(:district_name => f,:zone_id => @zone.id, :code => "J",:lab_name => "",:lab_present => "No")
    # end
      #puts "creating block for district bikaner"
    # @c = ["BIKANER",
    #        "DUNGARGARH",
    #        "KOLAYAT",
    #        "LUNKARANSAR",
    #        "NOKHA"
    #      ]
    
    # @c.each do |f|
    #   @district = Admin::District.find_by_district_name("BIKANER")
    #   Admin::Block.create(:block_name => f, :district_id => @district.id, :code => "", :lab_name => "", :laboratory_present => "No")
    # end

     puts "creating water source type"
    WaterSourceType.create(:source_type => "Public")
    WaterSourceType.create(:source_type => "Private")

     puts "creating priority"
    Priority.create(:priority_name => "LOW")
    Priority.create(:priority_name => "Medium")
    Priority.create(:priority_name => "HIGH")




