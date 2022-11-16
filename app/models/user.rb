class User < ActiveRecord::Base
    has_many :likes, dependent: :destroy
    has_secure_password

    def welcome
        "Hi, #{self.username}! Welcome to FreebieAlert"
    end
end
