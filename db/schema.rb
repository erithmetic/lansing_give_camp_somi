# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100327152824) do

  create_table "event_volunteers", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "event_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_volunteers", ["event_id"], :name => "index_event_volunteers_on_event_id"
  add_index "event_volunteers", ["user_id"], :name => "index_event_volunteers_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "date"
    t.string   "location"
    t.float    "number_of_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "minimum_volunteers"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_blocks", :force => true do |t|
    t.string   "description"
    t.float    "hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "user_time_blocks", :force => true do |t|
    t.integer  "time_block_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_time_blocks", ["time_block_id"], :name => "index_user_time_blocks_on_time_block_id"
  add_index "user_time_blocks", ["user_id"], :name => "index_user_time_blocks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "phone"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.integer  "group_id"
    t.integer  "count"
  end

end
