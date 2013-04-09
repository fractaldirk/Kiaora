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

ActiveRecord::Schema.define(:version => 20130409113943) do

  create_table "competencies", :force => true do |t|
    t.integer  "indicator"
    t.integer  "position_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "competencies", ["position_id"], :name => "index_competencies_on_position_id"

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
  end

  create_table "positions", :force => true do |t|
    t.string   "job_title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "responsibilities", :force => true do |t|
    t.integer  "indicator"
    t.string   "content"
    t.integer  "position_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "responsibilities", ["position_id"], :name => "index_responsibilities_on_position_id"

end
