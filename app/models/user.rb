class User < ApplicationRecord
        include ActiveModel::API

    validates :id, presence: true
    validates :username, presence: true
    validates :password, presence: true

    has_many :lists, dependent: :destroy
end
