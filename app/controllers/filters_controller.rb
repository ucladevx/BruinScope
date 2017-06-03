class FiltersController < ApplicationController
  def filter
    filters_hash = params.slice(:role)
    hash = {role: Post.roles[filters_hash[:role]]}
    @posts = Post.filter(hash)
    respond_to do |format|
      format.js
    end
  end
end
