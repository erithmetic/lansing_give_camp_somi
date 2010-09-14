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

ActiveRecord::Schema.define(:version => 20100914104920) do

  create_table "event_volunteers", :force => true do |t|
    t.integer  "user_id",         :null => false
    t.integer  "event_id",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_in_group"
    t.boolean  "alternate"
    t.string   "comments"
    t.boolean  "confirmed"
  end

  add_index "event_volunteers", ["event_id"], :name => "index_event_volunteers_on_event_id"
  add_index "event_volunteers", ["user_id"], :name => "index_event_volunteers_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description",             :limit => 255
    t.datetime "date"
    t.string   "location"
    t.float    "number_of_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "minimum_volunteers"
    t.integer  "maximum_volunteers"
    t.boolean  "closed"
    t.boolean  "subject_to_cancellation"
  end

  create_table "fund_raisings", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_items", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "group"
  end

end
