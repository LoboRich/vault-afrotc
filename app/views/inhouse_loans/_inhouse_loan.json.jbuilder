json.extract! inhouse_loan, :id, :client_id, :loan_id, :terms, :loan_financing, :balance, :processing_fees, :downpayment, :interest, :principal, :monthly_amort, :contract_date, :amortization_start_date, :remarks, :other_expense, :created_at, :updated_at
json.url inhouse_loan_url(inhouse_loan, format: :json)
