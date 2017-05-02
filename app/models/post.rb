class Post < ApplicationRecord
  # acts_as_votable: Posts is a votable model.
  acts_as_votable

  belongs_to :user

	validates :title, presence: true
	validates :experience, presence: true

end
