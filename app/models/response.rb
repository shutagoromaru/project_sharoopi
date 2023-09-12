class Response < ApplicationRecord
# Validation
validates :user_id, presence: true
validates :content, presence: true

belongs_to :user
belongs_to :consulting
has_many :favorites, dependent: :destroy
end
