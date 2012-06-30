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

ActiveRecord::Schema.define(:version => 20120626222645) do

  create_table "players", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "team",       :null => false
    t.string   "sex",        :null => false
    t.integer  "age",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "qualifications", :force => true do |t|
    t.integer  "first",      :default => 0, :null => false
    t.integer  "second",     :default => 0, :null => false
    t.integer  "third",      :default => 0, :null => false
    t.integer  "fourth",     :default => 0, :null => false
    t.integer  "total",      :default => 0, :null => false
    t.integer  "standings",  :default => 1, :null => false
    t.integer  "player_id",                 :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
