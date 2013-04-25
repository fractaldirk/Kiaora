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

ActiveRecord::Schema.define(:version => 20130425112126) do

  create_table "activities", :force => true do |t|
    t.string   "user_name"
    t.string   "content"
    t.string   "link"
    t.string   "action"
    t.integer  "office"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "attitudes", :force => true do |t|
    t.string   "description"
    t.integer  "position_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "attitudes", ["position_id"], :name => "index_attitudes_on_position_id"

  create_table "conditions", :force => true do |t|
    t.string   "environment"
    t.integer  "position_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "conditions", ["position_id"], :name => "index_conditions_on_position_id"

  create_table "dictionaries", :force => true do |t|
    t.string   "competency_english"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "competency_spanish"
    t.string   "competency_french"
    t.integer  "indicator"
  end

  create_table "functionals", :force => true do |t|
    t.integer  "indicator"
    t.integer  "position_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "value"
    t.integer  "importance"
  end

  add_index "functionals", ["position_id"], :name => "index_functionals_on_position_id"

  create_table "leaderships", :force => true do |t|
    t.integer  "indicator"
    t.integer  "position_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "value"
    t.integer  "importance"
  end

  add_index "leaderships", ["position_id"], :name => "index_leaderships_on_position_id"

  create_table "methodrelations", :force => true do |t|
    t.integer  "indicator"
    t.integer  "position_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "value"
    t.integer  "importance"
  end

  add_index "methodrelations", ["position_id"], :name => "index_methodrelations_on_position_id"

  create_table "organisationals", :force => true do |t|
    t.integer  "indicator"
    t.integer  "importance"
    t.integer  "value"
    t.integer  "position_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "english"
    t.string   "french"
    t.string   "spanish"
  end

  add_index "organisationals", ["position_id"], :name => "index_organisationals_on_position_id"

  create_table "positions", :force => true do |t|
    t.string   "job_title"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "office"
    t.text     "scope"
    t.date     "valid_from"
    t.string   "job_grade"
    t.string   "reports_to"
    t.string   "line_manages"
    t.text     "purpose"
    t.integer  "draft"
    t.string   "user_name"
    t.string   "salary_range"
    t.boolean  "salary_range_cb"
    t.boolean  "job_grade_cb"
    t.boolean  "valid_from_cb"
    t.boolean  "reports_to_cb"
    t.boolean  "line_manages_cb"
    t.decimal  "fte"
    t.boolean  "fte_cb"
    t.integer  "permanent"
    t.boolean  "permanent_cb"
  end

  create_table "responsibilities", :force => true do |t|
    t.integer  "indicator"
    t.string   "content"
    t.integer  "position_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "responsibilities", ["position_id"], :name => "index_responsibilities_on_position_id"

  create_table "socials", :force => true do |t|
    t.integer  "indicator"
    t.integer  "position_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "value"
    t.integer  "importance"
  end

  add_index "socials", ["position_id"], :name => "index_socials_on_position_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "office"
    t.integer  "language"
    t.integer  "role"
    t.string   "user_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
