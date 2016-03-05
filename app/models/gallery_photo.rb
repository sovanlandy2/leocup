class GalleryPhoto < ActiveRecord::Base

	has_attached_file :photo, styles: { medium: "500x500>", thumb: "200x200>" }, default_url: "http://www.logoworks.com/blog/wp-content/themes/fearless/images/missing-image-640x360.png"
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

	belongs_to :team_left, class_name: "Team", foreign_key: "team_left_id"
  	belongs_to :team_right, class_name: "Team", foreign_key: "team_right_id"
end
