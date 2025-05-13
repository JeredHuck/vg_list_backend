class List < ApplicationRecord
    include ActiveModel::API

    validates :id, presence: true
    validates :title, presence: true
    validates :content, presence: true

    belongs_to :user
end
