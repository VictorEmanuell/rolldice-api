class Attack < ApplicationRecord
    belongs_to :character

    scope :character_id, -> (character_id) {where(character_id: character_id)}
end
