class Character < ApplicationRecord
    belongs_to :user

    scope :user_id, -> (user_id) {where(user_id: user_id)}

    def self.user_id_from_character(user_id, id)
        find_by(user_id: user_id, id: id)
    end
end
