class PostPhoto < ActiveRecord::Base
	has_attached_file :photo, styles: { medium: "800x800>", thumb: "200x200>" }, default_url: "http://www.logoworks.com/blog/wp-content/themes/fearless/images/missing-image-640x360.png"
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

	belongs_to :post
end
