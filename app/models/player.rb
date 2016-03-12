class Player < ActiveRecord::Base
	belongs_to :team

	translates :name
end
