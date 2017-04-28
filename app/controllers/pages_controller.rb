class PagesController < ApplicationController
	def home
		@post = Post.new
	end
end
