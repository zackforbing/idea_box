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

ActiveRecord::Schema.define(version: 20160723031152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ideas", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "category_id"
    t.index ["category_id"], name: "index_ideas_on_category_id", using: :btree
    t.index ["user_id"], name: "index_ideas_on_user_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images_ideas", force: :cascade do |t|
    t.integer  "ideas_id"
    t.integer  "images_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ideas_id"], name: "index_images_ideas_on_ideas_id", using: :btree
    t.index ["images_id"], name: "index_images_ideas_on_images_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
  end

  add_foreign_key "ideas", "categories"
  add_foreign_key "ideas", "users"
  add_foreign_key "images_ideas", "ideas", column: "ideas_id"
  add_foreign_key "images_ideas", "images", column: "images_id"
end
