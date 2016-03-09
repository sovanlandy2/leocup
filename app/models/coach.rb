class Coach < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path("missing-image.png")
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	belongs_to :team
	
end
