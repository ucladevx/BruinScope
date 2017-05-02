class PagesController < ApplicationController
	def home
		@post = Post.new
    @posts = Post.all
    # Change this to top 12 companies
    @companies = Company.all
	end
end
