class PagesController < ApplicationController
	def home
		@post = Post.new
    @posts = Post.all
    # Change this to top 12 companies
    @companies = Company.all
	end

	def search
		@search = params[:search]
		# Gets the company based on the search
		@company = Company.where("lower(name) LIKE ?", "%" + @search.downcase + "%")
	end
end
