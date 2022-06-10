# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_09_232732) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_loans", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.string "user", null: false
    t.date "loan_date", null: false
    t.date "return_date", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_loans_on_book_id"
  end

  create_table "book_requests", force: :cascade do |t|
    t.string "user", null: false
    t.string "isbn", null: false
    t.string "title", null: false
    t.string "publisher", null: false
    t.date "published_date", null: false
    t.string "category", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.string "author", null: false
    t.string "isbn", null: false
    t.string "publisher", null: false
    t.date "published_date", null: false
    t.string "category", null: false
    t.text "description"
    t.integer "copy", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titles", force: :cascade do |t|
    t.string "author", null: false
    t.string "isbn", null: false
    t.string "publisher", null: false
    t.date "published_date", null: false
    t.string "category", null: false
    t.text "description"
    t.integer "copy", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "book_loans", "books"
end
