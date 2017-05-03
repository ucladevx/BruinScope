class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, {omniauth_providers: [:google_oauth2]}

  # acts_as_votable: Users "act as voter" to provide some reserve functionality.
  acts_as_voter

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Create user if it doesn't exist.
    unless user
      user = User.create(
        first_name: data["first_name"].capitalize,
        last_name: data["last_name"].capitalize,
        email: data["email"],
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

end
