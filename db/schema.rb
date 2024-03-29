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

ActiveRecord::Schema.define(:version => 20111106115127) do

  create_table "comments", :force => true do |t|
    t.string   "text"
    t.integer  "value",      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "kudo_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kudos", :force => true do |t|
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "from"
    t.integer  "to"
    t.integer  "season_id"
  end

  create_table "prizes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "value"
    t.integer  "season_id"
  end

  create_table "seasons", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "starting_kudos"
    t.integer  "max_kudos_per_user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.boolean  "active",             :default => false
  end

  create_table "timelines", :force => true do |t|
    t.integer  "event_id"
    t.string   "event_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role",            :default => "user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.integer  "given_kudos"
    t.integer  "received_kudos"
    t.string   "salt"
  end

end
