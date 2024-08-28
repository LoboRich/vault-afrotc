json.extract! water_bill, :id, :client_id, :loan_id, :previous, :current, :consume, :amount, :or_number, :due_date, :reading_date, :grace_period, :status, :remarks, :penalty, :total, :mode_of_payment, :receipt, :reference_number, :created_at, :updated_at
json.url water_bill_url(water_bill, format: :json)
