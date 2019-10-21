# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_21_154546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_pictures", force: :cascade do |t|
    t.bigint "album_id", null: false
    t.bigint "picture_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_album_pictures_on_album_id"
    t.index ["picture_id"], name: "index_album_pictures_on_picture_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "photographer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["photographer_id"], name: "index_albums_on_photographer_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "photographers", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.text "bio"
    t.date "start_date"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "picture_categories", force: :cascade do |t|
    t.bigint "picture_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_picture_categories_on_category_id"
    t.index ["picture_id"], name: "index_picture_categories_on_picture_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "photographer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["photographer_id"], name: "index_pictures_on_photographer_id"
  end

  add_foreign_key "album_pictures", "albums"
  add_foreign_key "album_pictures", "pictures"
  add_foreign_key "albums", "photographers"
  add_foreign_key "picture_categories", "categories"
  add_foreign_key "picture_categories", "pictures"
  add_foreign_key "pictures", "photographers"
end
