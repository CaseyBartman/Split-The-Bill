json.extract! expense, :id, :trip_id, :name, :expense_type, :amount, :payer_id, :date, :created_at, :updated_at
json.url expense_url(expense, format: :json)
