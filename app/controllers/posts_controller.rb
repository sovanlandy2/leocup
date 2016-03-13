class PostsController < ApplicationController
	def index
		@posts = Post.includes(:post_photos).order("created_at desc")
		image_url = @posts.last.post_photos.first.photo.url rescue nil
		set_meta_tags og: { image: image_url, title: "News from Leocup Volleybal 2016"}
	end

	def show
		@post = Post.find(params[:id])
		image_url = @post.post_photos.first.photo.url rescue nil
		set_meta_tags og: { image: image_url, title: @post.title}
	end
end