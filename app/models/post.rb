class Post < ApplicationRecord
  belongs_to :user

	validates :title, presence: true
	validates :experience, presence: true

end
