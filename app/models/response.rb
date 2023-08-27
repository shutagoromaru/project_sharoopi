class Response < ApplicationRecord
# Validation
validates :user_id, presence: true
validates :content, presence: true

end
