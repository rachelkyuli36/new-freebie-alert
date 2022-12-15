class User < ActiveRecord::Base
    has_many :likes, dependent: :destroy
    has_secure_password
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    before_create :confirmation_token

    # def welcome
    #     "Hi, #{self.username}! Welcome to FreebieAlert"
    # end

    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
    end

    private
    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
