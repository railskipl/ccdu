# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140228094313) do

  create_table "admin_blocks", :force => true do |t|
    t.string   "block_name"
    t.integer  "district_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "code"
    t.string   "lab_name"
    t.string   "laboratory_present"
  end

  create_table "admin_districts", :force => true do |t|
    t.string   "district_name"
    t.integer  "zone_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "code"
    t.string   "lab_name"
    t.string   "lab_present"
  end

  create_table "admin_grampanchyats", :force => true do |t|
    t.string   "gram_name"
    t.integer  "block_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "admin_habitations", :force => true do |t|
    t.string   "habitation_name"
    t.integer  "village_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "admin_sources", :force => true do |t|
    t.string   "source_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "code"
  end

  create_table "admin_villages", :force => true do |t|
    t.string   "village_name"
    t.integer  "grampanchyat_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "admin_zones", :force => true do |t|
    t.string   "zone_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "block_laboratories", :force => true do |t|
    t.string   "labname"
    t.text     "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "mobile_devices", :force => true do |t|
    t.string   "imei"
    t.string   "manufacturer_name"
    t.string   "phone_no"
    t.date     "purchase_date"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "user_id"
  end

  create_table "mobile_users", :force => true do |t|
    t.integer  "user_id"
    t.string   "imei"
    t.integer  "mobile_user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "parameters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "display_name"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "survey_reports", :force => true do |t|
    t.string   "source_name"
    t.string   "source_code"
    t.string   "source_location"
    t.string   "habitation"
    t.string   "village"
    t.string   "grampanchayat"
    t.string   "water_source_type"
    t.datetime "date_time"
    t.string   "surveyor_name"
    t.integer  "user_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image1_file_name"
    t.string   "image1_content_type"
    t.integer  "image1_file_size"
    t.datetime "image1_updated_at"
    t.integer  "actions",              :default => 0
    t.string   "ph"
    t.string   "tds"
    t.string   "residual_chlorine"
    t.string   "fluoride"
    t.string   "chloride"
    t.string   "nitrate"
    t.string   "alkaliniy"
    t.string   "total_hardness"
    t.string   "bacteriological"
    t.text     "reason_for_rejecting"
    t.boolean  "is_tested",            :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "username"
    t.string   "zone_name"
    t.string   "user_fullname"
    t.string   "mobile_no"
    t.string   "district_name"
    t.string   "block_name"
    t.boolean  "status",                 :default => false
    t.integer  "block_manager_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
