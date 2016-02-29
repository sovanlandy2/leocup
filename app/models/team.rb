class Team < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	
	has_many :players
	has_one :coach
	belongs_to :region
end
