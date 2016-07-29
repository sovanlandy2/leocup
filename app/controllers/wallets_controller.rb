class WalletsController < ApplicationController
	def index
		render layout: false
	end

	def getpass
		send_file Rails.public_path+ "amazongc.pkpass", type: 'application/vnd.apple.pkpass', disposition: 'attachment', filename: "pass.pkpass"
	end
end
