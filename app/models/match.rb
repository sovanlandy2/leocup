class Match < ActiveRecord::Base
	
	belongs_to :tournament
	belongs_to :team_left, class_name: "Team", foreign_key: "team_left_id"
  	belongs_to :team_right, class_name: "Team", foreign_key: "team_right_id"

  	attr_accessor   :score_raw

	def score_raw
		self.score.join("\n") unless self.score.nil?
	end

	def score_raw=(values)
		self.score = []
		self.score=values.split("\n")
	end

	def match_date_format
		date = self.match_date
		return nil if date.blank?
		day = khmer_day date.wday
		date_string = "#{date.day}/#{date.month}/#{date.year}"
		time = "#{date.hour}::#{date.minute}"
		return "#{day} #{date}, #{time}"
	end

	def khmer_day i
		data = ['ថ្ងៃចន្ទ', 'ថ្ងៃអង្គារ', 'ថ្ងៃពុធ', 'ថ្ងៃព្រហស្បតិ៍', 'ថ្ងៃសុក្រ', 'ថ្ងៃសៅរ៍', 'ថ្ងៃអាទិត្យ']
		data[i]		
	end
end
