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

ActiveRecord::Schema.define(:version => 20130528151515) do

  create_table "employees", :force => true do |t|
    t.integer  "employee_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "hire_date"
    t.float    "sick_days"
    t.float    "vacation_days"
    t.float    "sick_days_used"
    t.float    "vacation_days_used"
    t.float    "remaining_sick_days"
    t.float    "remaining_vacation_days"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "furloughs", :force => true do |t|
    t.float    "duration"
    t.date     "date_from"
    t.date     "date_to"
    t.string   "description"
    t.string   "length_of_day"
    t.text     "note"
    t.integer  "employee_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "admin",           :default => false
  end

end