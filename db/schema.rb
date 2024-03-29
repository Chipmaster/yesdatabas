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

ActiveRecord::Schema.define(:version => 20100427042712) do

  create_table "data_fields", :force => true do |t|
    t.string  "value"
    t.integer "user_id"
    t.integer "field_type_id"
  end

  create_table "field_types", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "usertype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
  end

end
