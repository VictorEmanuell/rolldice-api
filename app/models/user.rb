class User < ApplicationRecord
    validates :email, presence: true

    has_many :characters

    def character_id (character_id)
        characters.find_by(id: character_id)
    end
end
