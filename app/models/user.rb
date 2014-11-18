class User < ActiveRecord::Base

    
    has_many :microposts, dependent: :destroy

	validates :name, length: { in: 9..30 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX }

    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true

    has_secure_password    

    before_save do |user| 
              user.email = email.downcase 
            user.remember_token = SecureRandom.urlsafe_base64
            end


    def feed
        Micropost.where("user_id = ?", id)
    end

end
