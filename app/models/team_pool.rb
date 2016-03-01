class TeamPool < ActiveRecord::Base
	belongs_to :pool
	belongs_to :team

	accepts_nested_attributes_for :team,
                                :reject_if => :all_blank
end
