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

ActiveRecord::Schema[7.0].define(version: 2024_03_15_083640) do
  create_table "answers", charset: "utf8mb4", force: :cascade do |t|
    t.integer "option"
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "session_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pattern"
  end

  create_table "composite_images", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.string "composite_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "poster_id"
    t.index ["room_id"], name: "index_composite_images_on_room_id"
    t.index ["user_id"], name: "index_composite_images_on_user_id"
  end

  create_table "contacts", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "subject", null: false
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "poster_answers", charset: "utf8mb4", force: :cascade do |t|
    t.integer "option"
    t.bigint "question_id", null: false
    t.bigint "poster_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poster_id"], name: "index_poster_answers_on_poster_id"
    t.index ["question_id"], name: "index_poster_answers_on_question_id"
  end

  create_table "poster_results", charset: "utf8mb4", force: :cascade do |t|
    t.integer "category_id"
    t.integer "poster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posters", charset: "utf8mb4", force: :cascade do |t|
    t.string "image", null: false
    t.string "url", null: false
    t.string "title", null: false
    t.float "height", null: false
    t.float "width", null: false
    t.integer "price"
    t.string "artist"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", charset: "utf8mb4", force: :cascade do |t|
    t.text "body"
    t.text "first_option"
    t.text "second_option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", charset: "utf8mb4", force: :cascade do |t|
    t.string "image"
    t.string "image_cache"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "session_id"
  end

  create_table "sns_credentials", charset: "utf8mb4", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sns_credentials_on_user_id"
  end

  create_table "user_results", charset: "utf8mb4", force: :cascade do |t|
    t.integer "category_id"
    t.string "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "composite_images", "rooms"
  add_foreign_key "poster_answers", "posters"
  add_foreign_key "poster_answers", "questions"
  add_foreign_key "sns_credentials", "users"
end
