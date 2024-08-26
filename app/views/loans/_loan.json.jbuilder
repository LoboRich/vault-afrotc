json.extract! loan, :id, :client_id, :blocklot, :terms, :model_house, :loan_financing, :contract_price, :processing_fees, :downpayment, :interest, :principal, :monthly_amort, :contract_date, :amortization_start_date, :balance, :remarks, :status, :broker, :created_at, :updated_at
json.url loan_url(loan, format: :json)
