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

ActiveRecord::Schema.define(version: 20150905234419) do

  create_table "comments", force: :cascade do |t|
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "starttime"
    t.text     "website",     limit: 65535
    t.text     "description", limit: 65535
    t.text     "hostclass",   limit: 65535
    t.text     "location",    limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "comments_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "endtime"
  end

  add_index "events", ["comments_id"], name: "index_events_on_comments_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.text     "reltype",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
    t.text     "otherid",    limit: 65535
  end

  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "facebookid",      limit: 65535
    t.text     "categories",      limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "events_id",       limit: 4
    t.integer  "relationship_id", limit: 4
    t.text     "gender",          limit: 65535
    t.text     "picture",         limit: 65535
    t.text     "fblink",          limit: 65535
  end

  add_index "users", ["events_id"], name: "index_users_on_events_id", using: :btree
  add_index "users", ["facebookid"], name: "index_users_on_facebookid", unique: true, length: {"facebookid"=>50}, using: :btree
  add_index "users", ["relationship_id"], name: "index_users_on_relationship_id", using: :btree

end
