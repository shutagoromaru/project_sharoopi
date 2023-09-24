class Response < ApplicationRecord
    # Validation
    validates :user_id, presence: true
    validates :content, presence: true

    belongs_to :user
    belongs_to :consulting
    has_many :favorites, dependent: :destroy

    # has_many :my_favorites, (user_id) -> { where(user_id: user_id) }, class_name: 'Favorite'

    def favorited?(user_id)
        favorites.where(user_id: user_id).exists?
    end
 

end
