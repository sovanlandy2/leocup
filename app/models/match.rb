class Match < ActiveRecord::Base
	
	belongs_to :tournament
	belongs_to :team_left, class_name: "Team", foreign_key: "team_left_id"
  	belongs_to :team_right, class_name: "Team", foreign_key: "team_right_id"

  	default_scope { where("match_date is not null") }
  	scope :date_desc, -> {order("match_date desc nulls last")}
  	scope :date_asc, -> {order("match_date asc nulls last")}
  	scope :completed, -> {where(is_completed: true)}
  	scope :not_completed, -> {where(is_completed: false)}

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
		date_string = date.strftime("%d-%m-%Y")
		time = "#{date.hour}:00"
		return "#{day} #{date_string}"
	end

	def khmer_day i
		data = ['ថ្ងៃអាទិត្យ','ថ្ងៃចន្ទ', 'ថ្ងៃអង្គារ', 'ថ្ងៃពុធ', 'ថ្ងៃព្រហស្បតិ៍', 'ថ្ងៃសុក្រ', 'ថ្ងៃសៅរ៍']
		data[i]		
	end

	def get_status
		self.is_completed?? "ការប្រកួតបានបពា្ចប់" : "ការប្រកួតមិនទាន់ចាប់ផ្តើម"
	end
end
