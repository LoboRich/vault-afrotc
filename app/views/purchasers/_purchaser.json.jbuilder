json.extract! purchaser, :id, :name, :budget, :expense, :date_started, :deadline, :status, :remarks, :parcel_id, :created_at, :updated_at
json.url purchaser_url(purchaser, format: :json)
