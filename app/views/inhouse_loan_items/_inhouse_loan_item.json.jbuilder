json.extract! inhouse_loan_item, :id, :term, :inhouse_loan_id, :due_date, :principal, :interest, :monthly_amort, :balance, :is_paid, :penalty, :advance, :payment_date, :or, :paid_amount, :created_at, :updated_at
json.url inhouse_loan_item_url(inhouse_loan_item, format: :json)
