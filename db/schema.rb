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

ActiveRecord::Schema[7.0].define(version: 2023_04_19_194905) do
  create_table "card_pacients", force: :cascade do |t|
    t.string "adress"
    t.string "diagnoz"
    t.integer "klinika_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["klinika_id"], name: "index_card_pacients_on_klinika_id"
  end

  create_table "klinikas", force: :cascade do |t|
    t.string "name"
    t.string "adress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "otdelenies", force: :cascade do |t|
    t.string "name"
    t.integer "klinika_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["klinika_id"], name: "index_otdelenies_on_klinika_id"
  end

  create_table "pacients", force: :cascade do |t|
    t.string "name"
    t.integer "card_pacient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_pacient_id"], name: "index_pacients_on_card_pacient_id"
  end

  create_table "specials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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

  create_table "vraches", force: :cascade do |t|
    t.string "name"
    t.integer "otdelenie_id"
    t.integer "special_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["otdelenie_id"], name: "index_vraches_on_otdelenie_id"
    t.index ["special_id"], name: "index_vraches_on_special_id"
  end

end
