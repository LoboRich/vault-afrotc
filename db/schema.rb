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

ActiveRecord::Schema[7.1].define(version: 2026_02_12_023315) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "event_date"
    t.text "location"
    t.string "event_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "rank"
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "branch_of_service"
    t.string "afpsn"
    t.string "primary_afsc"
    t.string "duty_afsc"
    t.text "other_skills"
    t.string "source_of_enlistment"
    t.string "soe_authority"
    t.date "soe_date_of_enlistment"
    t.string "soe_initial_rank"
    t.string "source_of_commission"
    t.string "soc_authority"
    t.date "soc_date_of_enlistment"
    t.string "soc_initial_rank"
    t.string "reservist_classification"
    t.string "classification_authority"
    t.date "date_of_classification"
    t.string "reserve_unit_assignment"
    t.date "date_assigned"
    t.string "unit_capability"
    t.string "present_designation"
    t.string "mobilization_center"
    t.string "street_address"
    t.string "city"
    t.string "province"
    t.string "region"
    t.string "zip_code"
    t.date "date_of_birth"
    t.string "place_of_birth"
    t.integer "age"
    t.string "sex"
    t.string "marital_status"
    t.string "religion"
    t.string "ethnic_group"
    t.string "blood_type"
    t.string "eye_color"
    t.string "hair_color"
    t.string "complexion"
    t.text "identifying_marks"
    t.integer "height_cm"
    t.integer "weight_kg"
    t.string "email"
    t.string "residence_tel"
    t.string "office_tel"
    t.string "mobile_nr"
    t.string "tin"
    t.string "sss_number"
    t.string "gsis_number"
    t.string "philhealth_number"
    t.string "pagibig_number"
    t.text "dialects_spoken"
    t.decimal "latitude"
    t.decimal "longitude"
    t.float "lat"
    t.float "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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

end
