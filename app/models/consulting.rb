class Consulting < ApplicationRecord
# Validation
validates :user_id, presence: true
validates :name, presence: true
validates :content, presence: true

belongs_to :user
has_many :responses, dependent: :destroy


end
