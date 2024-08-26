module ApplicationHelper
    def format_num(num)
		number_with_precision(num, delimiter: ",", separator: ".", precision: 2)
	end
end
