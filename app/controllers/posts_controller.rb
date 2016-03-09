class PostsController < ApplicationController
	def index
		@posts = Post.includes(:post_photos).order("created_at desc")
	end
end