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

ActiveRecord::Schema.define(version: 2020_06_03_095820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "partner_id"
    t.boolean "accepted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id"], name: "index_friends_on_partner_id"
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "company_id"
    t.integer "rating"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_games_on_company_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "play_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["play_id"], name: "index_messages_on_play_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "play_id"
    t.string "optional_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["play_id"], name: "index_participations_on_play_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "plays", force: :cascade do |t|
    t.boolean "done"
    t.boolean "won"
    t.date "date"
    t.bigint "game_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_plays_on_game_id"
    t.index ["user_id"], name: "index_plays_on_user_id"
  end

  create_table "tops", force: :cascade do |t|
    t.bigint "one_id"
    t.text "one_comment"
    t.bigint "two_id"
    t.text "two_comment"
    t.bigint "three_id"
    t.text "three_comment"
    t.bigint "four_id"
    t.text "four_comment"
    t.bigint "five_id"
    t.text "five_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["five_id"], name: "index_tops_on_five_id"
    t.index ["four_id"], name: "index_tops_on_four_id"
    t.index ["one_id"], name: "index_tops_on_one_id"
    t.index ["three_id"], name: "index_tops_on_three_id"
    t.index ["two_id"], name: "index_tops_on_two_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.string "location"
    t.float "longitude"
    t.float "latitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "friends", "users"
  add_foreign_key "games", "companies"
  add_foreign_key "messages", "plays"
  add_foreign_key "messages", "users"
  add_foreign_key "participations", "plays"
  add_foreign_key "participations", "users"
  add_foreign_key "plays", "games"
  add_foreign_key "plays", "users"
end
