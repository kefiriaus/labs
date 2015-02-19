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

ActiveRecord::Schema.define(version: 20150213092521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "note_tags", id: false, force: true do |t|
    t.integer "note_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "note_tags", ["note_id", "tag_id"], name: "index_note_tags_on_note_id_and_tag_id", using: :btree

  create_table "notes", force: true do |t|
    t.boolean  "active"
    t.string   "name"
    t.string   "code"
    t.integer  "sort"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.boolean  "active"
    t.integer  "sort"
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
