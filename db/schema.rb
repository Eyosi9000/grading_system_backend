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

ActiveRecord::Schema[7.0].define(version: 2022_07_10_164917) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_rooms", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "instructor_id", null: false
    t.integer "class_room_no", null: false
    t.string "semester", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "year"
    t.index ["course_id"], name: "index_class_rooms_on_course_id"
    t.index ["instructor_id"], name: "index_class_rooms_on_instructor_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name", null: false
    t.text "course_description"
    t.integer "credit_hour", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "submission"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrars", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "class_room_id", null: false
    t.string "grade"
    t.index ["class_room_id"], name: "index_students_on_class_room_id"
  end

  add_foreign_key "class_rooms", "courses"
  add_foreign_key "class_rooms", "instructors"
  add_foreign_key "students", "class_rooms"
end
