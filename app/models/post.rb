class Post < ApplicationRecord
  # acts_as_votable: Post is a votable model.
  acts_as_votable

  # acts_as_commentable: Post is a commentable model.
  acts_as_commentable

  belongs_to :user
  belongs_to :company

	validates :title, presence: true
	validates :experience, presence: true

  enum role: [:software, :product, :design, :data]
  enum difficulty: [:easy, :avg, :difficult]
  enum offer: [:accepted, :declined, :no_offer]

end
