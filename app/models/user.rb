class User < ActiveRecord::Base
    has_secure_password

    validates :name, :email, presence: true

    has_many :devices
end