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

ActiveRecord::Schema[7.1].define(version: 2024_04_05_163212) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_fields", force: :cascade do |t|
    t.bigint "answer_id", null: false
    t.bigint "field_id", null: false
    t.string "string_body"
    t.text "text_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "outdated", default: false
    t.index ["answer_id"], name: "index_answer_fields_on_answer_id"
    t.index ["field_id"], name: "index_answer_fields_on_field_id"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "form_id", null: false
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "outdated", default: false
    t.index ["form_id"], name: "index_answers_on_form_id"
  end

  create_table "fields", force: :cascade do |t|
    t.bigint "form_id", null: false
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label"
    t.boolean "outdated", default: false
    t.index ["form_id"], name: "index_fields_on_form_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "title"
    t.boolean "can_answer", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answer_fields", "answers"
  add_foreign_key "answer_fields", "fields"
  add_foreign_key "answers", "forms"
  add_foreign_key "fields", "forms"
end
