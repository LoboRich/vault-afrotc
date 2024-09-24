module ApplicationHelper
    def format_num(num)
		number_with_precision(num, delimiter: ",", separator: ".", precision: 2)
	end
	def current_page_class(path)
		request.path == path ? 'active-page' : ''
	end
	def format_currency(amount)
    number_to_currency(amount, unit: "₱ ", precision: 2, format: "%u%n")
  end
	def format_currency_with_space(amount)
    number_to_currency(amount, unit: "₱ ", precision: 2).strip
  end
	
	def badge_class_for(status)
		case status
		when 'Available'
		  'bg-primary'
		when 'For Follow-up'
		  'bg-warning'
		when 'Sold'
		  'bg-danger'
		when 'Reserved'
		  'bg-info'
		when 'Active'
		  'bg-primary'
		when 'Cash Only'
		  'bg-primary'
		when 'Site Office'
		  'bg-danger'
		when 'Inactive'
		  'bg-danger'
		when 'Approved'
		  'bg-success'
		else
		  'bg-info'  # Default class if status does not match any case
		end
	  end
	def admin_or_ceo?
    current_user && (current_user.role == 'Admin' || current_user.role == 'CEO')
  end
	
end
