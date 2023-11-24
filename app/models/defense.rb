class Defense < ApplicationRecord
    self.primary_key = :character_id
    
    belongs_to :character
end
