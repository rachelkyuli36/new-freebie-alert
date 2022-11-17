class User < ActiveRecord::Base
    has_many :likes, dependent: :destroy
    has_secure_password
    validates :username, uniqueness: true
    validates :email, uniqueness: true

    def welcome
        "Hi, #{self.username}! Welcome to FreebieAlert"
    end
end
