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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140206044655) do

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "delivery_date"
    t.string   "work"
    t.integer  "mobile"
    t.string   "address"
    t.datetime "request_date"
    t.decimal  "cash"
    t.decimal  "paid"
    t.decimal  "remained"
    t.decimal  "lft_sp"
    t.decimal  "lft_cl"
    t.decimal  "lft_ax"
    t.decimal  "rght_sp"
    t.decimal  "rght_cl"
    t.decimal  "rght_ax"
    t.string   "doctor"
    t.string   "req_store"
    t.string   "deliv_store"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
