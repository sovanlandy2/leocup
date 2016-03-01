class Tournament < ActiveRecord::Base

	has_many :pools
	has_many :matches
end
