class Company < ApplicationRecord
	# A Company will have many posts tied to it
	has_many :posts, dependent: :destroy

	# Every company needs a name and location
	validates :name , presence: true
	validates :location, presence: true

	# Always sets the image for a company upon creation
	after_validation :set_image

	private
		def set_image
			image_path = ActionController::Base.helpers.asset_path("#{self.name.downcase}.png")
			self.image = image_path.nil? ? "" : image_path
		end
end
