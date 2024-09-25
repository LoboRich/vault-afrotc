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

ActiveRecord::Schema[7.1].define(version: 2024_09_25_132333) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.string "birth_cert_img"
    t.string "valid_id_img"
    t.string "proof_of_income_img"
    t.string "marriage_contract_img"
    t.string "spa_img"
    t.string "pdc_img"
  end

  create_table "histories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "description"
    t.string "model"
    t.string "model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_histories_on_user_id"
  end

  create_table "loan_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "term"
    t.uuid "loan_id", null: false
    t.date "duedate"
    t.float "principal"
    t.float "interest"
    t.float "monthly_amort"
    t.float "balance"
    t.boolean "is_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "penalty", default: 0.0
    t.float "advance", default: 0.0
    t.datetime "payment_date"
    t.string "or"
    t.float "paid_amount", default: 0.0
    t.index ["loan_id"], name: "index_loan_items_on_loan_id"
  end

  create_table "loan_parcels", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "loan_id", null: false
    t.uuid "parcel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_id"], name: "index_loan_parcels_on_loan_id"
    t.index ["parcel_id"], name: "index_loan_parcels_on_parcel_id"
  end

  create_table "loans", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "client_id", null: false
    t.string "blocklot"
    t.integer "terms"
    t.string "model_house"
    t.string "loan_financing"
    t.float "contract_price"
    t.float "processing_fees"
    t.float "downpayment"
    t.float "interest"
    t.float "principal"
    t.float "monthly_amort"
    t.date "contract_date"
    t.date "amortization_start_date"
    t.float "balance"
    t.text "remarks"
    t.string "status"
    t.string "broker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "other_expense"
    t.index ["client_id"], name: "index_loans_on_client_id"
  end

  create_table "parcels", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "block"
    t.string "lot"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "subdivision_id"
    t.string "lot_area"
    t.string "house_area"
    t.text "description"
    t.float "selling_price", default: 0.0
    t.string "model"
    t.index ["subdivision_id"], name: "index_parcels_on_subdivision_id"
  end

  create_table "payment_histories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "loan_id", null: false
    t.float "current_balance"
    t.float "interest", default: 0.0
    t.float "payment", default: 0.0
    t.float "new_balance", default: 0.0
    t.string "mode_of_payment"
    t.string "check_bank"
    t.string "check_no"
    t.string "bank_name"
    t.string "bank_account_no"
    t.string "ar_account_no"
    t.float "penalty", default: 0.0
    t.float "processing", default: 0.0
    t.float "reservation", default: 0.0
    t.float "equity", default: 0.0
    t.text "others"
    t.float "advance_payment_to_principal", default: 0.0
    t.float "principal"
    t.float "downpayment"
    t.float "processing_fee", default: 0.0
    t.datetime "payment_date"
    t.string "or_num"
    t.string "memo"
    t.string "running_balance"
    t.boolean "is_deposited", default: false
    t.datetime "deposited_date"
    t.string "deposited_memo"
    t.string "deposited_bank_account"
    t.string "receipt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "loan_item_id", null: false
    t.float "advance_payment", default: 0.0
    t.index ["loan_id"], name: "index_payment_histories_on_loan_id"
    t.index ["loan_item_id"], name: "index_payment_histories_on_loan_item_id"
  end

  create_table "purchasers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.float "budget"
    t.float "expense"
    t.datetime "date_started"
    t.datetime "deadline"
    t.string "status"
    t.text "remarks"
    t.uuid "parcel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parcel_id"], name: "index_purchasers_on_parcel_id"
  end

  create_table "subdivisions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "short_code"
    t.string "location"
    t.string "status"
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

  create_table "water_bills", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "client_id", null: false
    t.uuid "loan_id", null: false
    t.integer "previous", default: 0
    t.integer "current", default: 0
    t.float "consume", default: 0.0
    t.float "amount", default: 0.0
    t.string "or_number"
    t.datetime "due_date"
    t.datetime "reading_date"
    t.datetime "grace_period"
    t.string "status", default: "unpaid"
    t.text "remarks"
    t.float "penalty", default: 0.0
    t.float "total", default: 0.0
    t.string "mode_of_payment"
    t.string "receipt"
    t.string "reference_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bank_name"
    t.datetime "payment_date"
    t.string "received_by"
    t.index ["client_id"], name: "index_water_bills_on_client_id"
    t.index ["loan_id"], name: "index_water_bills_on_loan_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "histories", "users"
  add_foreign_key "loan_items", "loans"
  add_foreign_key "loan_parcels", "loans"
  add_foreign_key "loan_parcels", "parcels"
  add_foreign_key "loans", "clients"
  add_foreign_key "parcels", "subdivisions"
  add_foreign_key "payment_histories", "loan_items"
  add_foreign_key "payment_histories", "loans"
  add_foreign_key "purchasers", "parcels"
  add_foreign_key "water_bills", "clients"
  add_foreign_key "water_bills", "loans"
end
