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

ActiveRecord::Schema.define(:version => 20130108173327) do

  create_table "dutytimes", :force => true do |t|
    t.integer  "dutytime_0", :default => 0
    t.integer  "dutytime_1", :default => 0
    t.integer  "dutytime_2", :default => 0
    t.integer  "dutytime_3", :default => 0
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "tel"
    t.string   "qq"
    t.string   "school"
    t.string   "sex",        :default => "male"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "properties", :force => true do |t|
    t.string   "position",   :default => "staff"
    t.boolean  "ispoor",     :default => false
    t.integer  "priority",   :default => 0
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "results", :force => true do |t|
    t.integer  "female"
    t.integer  "manager"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "coach"
    t.integer  "male1"
    t.integer  "male2"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.string   "userid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
