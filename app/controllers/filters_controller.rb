class FiltersController < ApplicationController
  def filter
    hash = {}
    roles = params[:roles]
    order_by = params[:order_by]
    print roles
    if roles && !roles.empty?
      print "roles"
      print roles
      roles_vals = roles.map{ |role| Post.roles[role]}
      print roles_vals
      hash[:filter_by_roles] = roles_vals
    end
    # unless order_by.empty?
    #   hash[:order_by] = order_by
    # end
    print "filter hash"
    print hash
    @posts = Post.filter(hash)
    print "POSTS"
    print @posts.inspect
    respond_to do |format|
      format.js
    end
  end
end
