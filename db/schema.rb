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

ActiveRecord::Schema.define(version: 20161111044830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.string   "user_id"
    t.text     "message"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  end

  create_table "neighborhood_alerts", force: :cascade do |t|
    t.string   "user_id"
    t.integer  "issue_type"
    t.text     "description"
    t.integer  "neighborhood_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["neighborhood_id"], name: "index_neighborhood_alerts_on_neighborhood_id", using: :btree
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "route_alerts", force: :cascade do |t|
    t.string   "user_id"
    t.integer  "issue_type"
    t.text     "description"
    t.string   "route_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "routes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "user_id"
    t.integer  "value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id", using: :btree
  end

  add_foreign_key "neighborhood_alerts", "neighborhoods"
end
