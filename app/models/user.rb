class User < ApplicationRecord
    
validates :username, presence: true, uniqueness: true, format: {
    with: /\A[a-zA-Z0-9_]{3,20}\z/, 
    message: "Username must be 3-20 characters and use only letters, numbers, and underscores."
}

has_many :lists, dependent: :destroy
has_secure_password
end
