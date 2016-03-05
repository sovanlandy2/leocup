class Team < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "http://www.logoworks.com/blog/wp-content/themes/fearless/images/missing-image-640x360.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	
	has_many :players
	has_one :coach
	belongs_to :region
	has_many :matches
	has_many :team_pools
	has_many :pools , through: :team_pools
	has_many :gallery_photos

	accepts_nested_attributes_for :coach
	accepts_nested_attributes_for :players

	def team_matches
		Match.where("team_left_id = ? OR team_right_id = ?", self.id, self.id)
		     .order("match_date desc")
	end

	def team_gallery_photos
		GalleryPhoto.where("team_left_id = ? OR team_right_id = ?", self.id, self.id)
					 .order("created_at desc")
	end
end
