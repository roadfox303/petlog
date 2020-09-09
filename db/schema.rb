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

ActiveRecord::Schema.define(version: 2020_09_07_031812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bonds", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "relation_category_id"
    t.index ["pet_id"], name: "index_bonds_on_pet_id"
    t.index ["relation_category_id"], name: "index_bonds_on_relation_category_id"
    t.index ["user_id"], name: "index_bonds_on_user_id"
  end

  create_table "contents", force: :cascade do |t|
    t.date "have_on", null: false
    t.bigint "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["have_on"], name: "index_contents_on_have_on"
    t.index ["pet_id"], name: "index_contents_on_pet_id"
  end

  create_table "icons", force: :cascade do |t|
    t.string "name", null: false
    t.string "style", null: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name", null: false
    t.string "avatar"
    t.string "species"
    t.string "sex"
    t.date "birthday"
    t.date "join_day"
    t.integer "join_age"
    t.text "comment"
    t.boolean "intrust", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["intrust"], name: "index_pets_on_intrust"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "record_categories", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.bigint "pet_id"
    t.bigint "icon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["icon_id"], name: "index_record_categories_on_icon_id"
    t.index ["pet_id"], name: "index_record_categories_on_pet_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "memo"
    t.bigint "content_id"
    t.bigint "record_category_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_records_on_content_id"
    t.index ["record_category_id"], name: "index_records_on_record_category_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "relation_categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
    t.integer "relation_category_id", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "family", default: false, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "avatar"
    t.text "comment"
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bonds", "pets"
  add_foreign_key "bonds", "relation_categories"
  add_foreign_key "bonds", "users"
  add_foreign_key "contents", "pets"
  add_foreign_key "pets", "users"
  add_foreign_key "record_categories", "icons"
  add_foreign_key "record_categories", "pets"
  add_foreign_key "records", "contents"
  add_foreign_key "records", "record_categories"
  add_foreign_key "records", "users"
end
