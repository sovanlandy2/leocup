class SliderPhoto < ActiveRecord::Base
	has_attached_file :photo, styles: { medium: "800x600>", thumb: "400x300>" }, default_url: ActionController::Base.helpers.asset_path("missing-image.png")
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
