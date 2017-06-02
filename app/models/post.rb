class Post < ApplicationRecord
  # Include custom filtering module
  include Filterable
  # acts_as_votable: Posts is a votable model.
  acts_as_votable

  # A Post belongs to a company and the user who created it
  belongs_to :user
  belongs_to :company

  # A Post will have many questions
  has_many :questions, dependent: :destroy

	# Requirements for a post
	validates :title, presence: true
	validates :experience, presence: true

	# Settings for each post for later filtering
  enum role: [:software, :product, :design, :data]
  enum difficulty: [:easy, :avg, :difficult]
  enum offer: [:accepted, :declined, :no_offer]

  # Scoping for new, trending and hot Posts
  # The count is meant to be the likes count passed to the scope
  scope :latest, ->{ order("created_at desc") }
  scope :trending, -> (count) { where("count >= ?", 1) }
  scope :hot, -> (count) { where("count >= ?", 3) }

	# Callback instantiation - finish up once questions are ready
	before_save :save_questions

  private

  # Callback to save questions to the relevant post
	def save_questions
		all_questions = self.question.split(/\s*•§£¡™\s*/)
		for q in all_questions
			Question.create(question: q, post_id: self.id)
		end
	end

end
