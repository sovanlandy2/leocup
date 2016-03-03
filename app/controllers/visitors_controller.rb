class VisitorsController < ApplicationController
	def index
		@matches = Match.order("updated_at desc").limit(5)
	end
end
