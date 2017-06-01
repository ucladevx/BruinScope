class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, {omniauth_providers: [:google_oauth2]}

  # acts_as_votable: Users "act as voter" to provide some reserve functionality.
  acts_as_voter

  # A user will have many posts if not posted anonymously
  has_many :posts

  # Profile image uploader 
  mount_uploader :avatar, AvatarUploader

  # Validate image integrity
  validates_integrity_of :avatar
  # Validate image processing
  validates_processing_of :avatar

	# Creating a user from Google Omniauth callback data
  def self.from_omniauth(access_token)
    data = access_token.info
    puts data
    user = User.where(:email => data["email"]).first

    # Create user if it doesn't exist.
    unless user
      user = User.create(
        first_name: data["first_name"].capitalize,
        last_name: data["last_name"].capitalize,
        email: data["email"],
        avatar: data["image"] ? data["image"] : ActionController::Base.helpers.asset_path("default-avatar.svg"),
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

	private
	# Validates that an image cannot be more than 5.0 Mega bytes
	def avatar_size_validation
		errors[:avatar] << "should be less than 5.0 MB" if avatar.size > 5.0.megabytes
	end

end
