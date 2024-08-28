module ApplicationHelper
    def format_num(num)
		number_with_precision(num, delimiter: ",", separator: ".", precision: 2)
	end
	def current_page_class(path)
		request.path == path ? 'active-page' : ''
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
		  'bg-warning'
		else
		  'bg-info'  # Default class if status does not match any case
		end
	  end
end
