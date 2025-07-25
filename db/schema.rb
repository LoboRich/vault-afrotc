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

ActiveRecord::Schema[7.1].define(version: 2025_07_25_135344) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "vehicle_id"
    t.uuid "franchise_id"
    t.string "image"
    t.string "filename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authorize_routes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "route_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "franchises", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "case_num"
    t.string "operator"
    t.integer "auth_num_of_units"
    t.date "date_granted"
    t.date "expiry_date"
    t.text "business_address"
    t.uuid "authorize_route_id"
    t.string "denomination"
    t.string "year_confirmed"
    t.string "status"
    t.text "remarks"
    t.integer "num_of_cpc"
    t.date "cpc_validity"
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

  create_table "vehicles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "classification"
    t.string "registered_owner"
    t.string "bus_num"
    t.string "mv_file"
    t.string "plate_num"
    t.string "ending_num"
    t.string "body_type"
    t.string "denomination"
    t.string "motor_num"
    t.string "chassis_num"
    t.integer "gross_weight"
    t.string "net_capacity"
    t.string "seat_capacity"
    t.string "make"
    t.integer "year_model"
    t.string "fuel"
    t.string "num_of_cyclinder"
    t.string "field_office"
    t.string "cr_num"
    t.date "cr_date_issue"
    t.string "or_field_office"
    t.string "or_num"
    t.date "or_date_issue"
    t.float "reg_amount"
    t.string "body_color"
    t.string "coc_date_coverage"
    t.string "coc_num"
    t.float "coc_amount"
    t.string "insurance_name"
    t.string "status"
    t.string "book_value"
    t.date "date_operate"
    t.date "date_retired"
    t.text "remarks"
    t.string "coi_date_coverage"
    t.string "quality_type"
    t.string "coi_num"
    t.string "coi_amount"
    t.string "piston_displacement"
    t.string "category"
    t.string "bus_series"
    t.string "present_holder"
    t.string "penalties_surcharge"
    t.string "cr_field_office"
    t.string "type_of_vehicle"
    t.string "route_per_operation"
    t.integer "year_rebuild"
    t.uuid "authorize_route_id"
    t.uuid "franchise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_registered", default: false
  end

end
