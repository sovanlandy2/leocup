class Post < ActiveRecord::Base
	has_many :post_photos

	accepts_nested_attributes_for :post_photos

	def post_date_format
		date = self.created_at
		return nil if date.blank?
		day = khmer_day date.wday
		
		return "#{khmer_month date.month-1} #{date.day}, #{date.year}"
	end

	def khmer_day i
		data = ['ថ្ងៃអាទិត្យ','ថ្ងៃចន្ទ', 'ថ្ងៃអង្គារ', 'ថ្ងៃពុធ', 'ថ្ងៃព្រហស្បតិ៍', 'ថ្ងៃសុក្រ', 'ថ្ងៃសៅរ៍']
		data[i]		
	end

	def khmer_month i
		data = [
			'មករា',
			'កុម្ភៈ',
			'មីនា',
			'មេសា',
			'ឧសភា',
			'មិថុនា',
			'កក្កដា',
			'សីហា',
			'កញ្ញា',
			'តុលា',
			'វិច្ឆិកា',
			'ធ្នូ'
		]		
		data[i]
	end
	
end
