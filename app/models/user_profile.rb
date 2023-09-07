class UserProfile < ApplicationRecord
# Validation
validates :user_id, presence: true
validates :name, presence: true

belongs_to :user
#has_many :consultings
#has_many :responses

 # ActiveStorage
 has_one_attached :image

end
