class Question < ApplicationRecord
	# A question belongs to a post
	belongs_to :post

	# A question can have comments
	acts_as_commentable

end
