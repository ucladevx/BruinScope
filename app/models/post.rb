class Post < ApplicationRecord
  # acts_as_votable: Posts is a votable model.
  acts_as_votable

  belongs_to :user
  belongs_to :company

	validates :title, presence: true
	validates :experience, presence: true

  enum role: [:software, :product, :design, :data]
  enum difficulty: [:easy, :avg, :difficult]
  enum offer: [:accepted, :declined, :no_offer]

end
