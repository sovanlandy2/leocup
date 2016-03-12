class Region < ActiveRecord::Base
	has_many :teams
	accepts_nested_attributes_for :teams

	translates :name
end
