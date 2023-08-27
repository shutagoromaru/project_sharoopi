class Consulting < ApplicationRecord
    belongs_to :user
# Validation
validates :user_id, presence: true
validates :title, presence: true
validates :content, presence: true

end
