class List < ApplicationRecord

   validates :title, presence: true
   validates :content, presence: true

   belongs_to :user
end
