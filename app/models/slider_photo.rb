class SliderPhoto < ActiveRecord::Base
	has_attached_file :photo, styles: { medium: "800x600>", thumb: "400x300>" }, default_url: "http://www.logoworks.com/blog/wp-content/themes/fearless/images/missing-image-640x360.png"
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
