class User < ActiveRecord::Base
	validates :name, length: { in: 9..30 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX }

    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true

    has_secure_password      # A magic method!!
end
