class WalletsController < ApplicationController
	def index
		render layout: false
	end

	def getpass
		send_file Rails.public_path+ "testimage.jpg", type: 'image/jpg', disposition: 'attachment', filename: "testimage.jpg"
	end
end
