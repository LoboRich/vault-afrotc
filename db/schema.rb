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

ActiveRecord::Schema[7.1].define(version: 2024_08_03_135435) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "clients", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "mobile_number"
    t.string "telephone_number"
    t.string "email_address"
    t.string "facebook_account_name"
    t.text "address"
    t.string "gender"
    t.string "civil_status"
    t.string "tin_number"
    t.string "id_type"
    t.string "id_number"
    t.string "occupation"
    t.string "years_employed"
    t.string "employer_name"
    t.string "employer_business_address"
    t.string "spouse_name"
    t.string "spouse_email"
    t.string "spouse_contact_number"
    t.text "spouse_address"
    t.string "spouse_id_type"
    t.string "spouse_id_number"
    t.string "spouse_tin_number"
    t.string "basic_salary"
    t.string "annual_income"
    t.string "status"
    t.text "remarks"
    t.json "documents"
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
    t.string "name"
    t.string "surname"
    t.string "role"
    t.boolean "status"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
