class Post < ActiveRecord::Base
	has_many :post_photos

	accepts_nested_attributes_for :post_photos
	
	translates :title, :content, :source
	
end
