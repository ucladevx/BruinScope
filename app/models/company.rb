class Company < ApplicationRecord
	has_many :posts

	validates :name , presence: true
	validates :location, presence: true

	after_validation :set_image

	private
		def set_image
			image_path = ActionController::Base.helpers.asset_path("#{self.name.downcase}.png")
			self.image = image_path.nil? ? "" : image_path
		end
end
