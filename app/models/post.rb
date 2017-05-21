class Post < ApplicationRecord
  # acts_as_votable: Posts is a votable model.
  acts_as_votable

  # A Post belongs to a company and the user who created it
  belongs_to :user
  belongs_to :company

	# Requirements for a post
	validates :title, presence: true
	validates :experience, presence: true

	# Settings for each post for later filtering
  enum role: [:software, :product, :design, :data]
  enum difficulty: [:easy, :avg, :difficult]
  enum offer: [:accepted, :declined, :no_offer]

end
