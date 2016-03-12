module ApplicationHelper
	
	def match_date_format date
		return nil if date.blank?
		
		locale = I18n.locale
		
		if locale == :km
		
			day = khmer_day date.wday
			date_string = date.strftime("%d-%m-%Y")
			return "#{day} #{date_string}"
		end
		return date.strftime("%a %d-%B-%Y")
	end

	private
		def khmer_day i
			data = ['ថ្ងៃអាទិត្យ','ថ្ងៃចន្ទ', 'ថ្ងៃអង្គារ', 'ថ្ងៃពុធ', 'ថ្ងៃព្រហស្បតិ៍', 'ថ្ងៃសុក្រ', 'ថ្ងៃសៅរ៍']
			data[i]		
		end
end
